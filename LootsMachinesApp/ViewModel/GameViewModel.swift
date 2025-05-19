//
//  GameViewModel.swift
//

import SwiftUI
import Combine
import func AVFoundation.AVMakeRect

final class GameViewModel: ObservableObject {
  @Published var size: CGSize = CGSize(width: 393, height: 851)
  @Published var isSplash = true
  
  @Published var balance = 600
  @Published var slots: [Slot] = []
  @Published var showBonus = false
  
  @Published var originalImage: UIImage? = UIImage(resource: .bg1)
  @Published var previewImage: UIImage? = UIImage(resource: .bg1)
  @Published var showSlotInfo = false
  
  // MARK: SLOT CREATION
  @Published var currentTile = 1
  @Published var currentBonusTile = 1
  @Published var currentBg = 1
  @Published var slotName = ""
  @Published var bonusVariant = 1
  @Published var showCreatedGame = false
  @Published var justCreated = false
  
  // MARK: - Game
  @Published var tableSize: CGSize = .zero
  @Published var isFirstSpin = true
  @Published var freespins = 0
  
  @Published var currentPayout = 0
  @Published var bet = 100
  @Published var itemsMatrix = Array(repeating: Array(repeating: 1, count: 50), count: 5)
  @Published var currentMatrix = Array(repeating: Array(repeating: 1, count: 3), count: 5)
  @Published var newPosition: [CGFloat] = Array(repeating: 0, count: 5)
  @Published var isPlusActive = true
  @Published var linesPlusActive = true
  @Published var balanceAnimCount: Double = 0
  @Published var maxBetAnimCount: Double = 0
  @Published var isRotationWin = false
  @Published var highlightItemsMatrix = Array(repeating: Array(repeating: 0, count: 50), count: 5)
  @Published var highlightMatrix = Array(repeating: Array(repeating: 0, count: 3), count: 5)
  
  private var initialProbabilities: [Double] = [10, 9, 8, 7, 6, 5, 4, 3, 2]
  private var probabilities: [Double] = [10, 9, 8, 7, 6, 5, 4, 3, 2]
  
  @Published var isFreeSpin = false
  @Published var freespinWin = 0
  @Published var bonusCount = 0
  
  var currentIndex = 0
  var timer: Timer?
  
  // MARK: Lines Logic
  @Published var currentWin = 0
  @Published var linesCount = 3
  @Published var luckyLinesDraw = Array(repeating: true, count: 9) // was false
  @Published var luckyRectDraw = Array(repeating: true, count: 9) // was false
  
  
  // Lines shapes
  func linesLogic() {
      bonusCount = 0
      var totalPayout = 0
      for line in (0..<linesCount) {
          var shape: [Int] = []
          var j = 0
          for pos in lines[line] {
              shape.append(currentMatrix[j][pos])
              j += 1
          }
          
          for symbol in Set(shape) {
              let matchingIndices = shape.enumerated().filter { $0.element == symbol }.map { $0.offset }
              
              if matchingIndices.count >= 3 {
                  for index in matchingIndices {
                      let column = index
                      let row = lines[line][column]
                      highlightMatrix[column][row] = 1
                  }
              }
              
              if shape.filter({ $0 == symbol }).count == 3 {
                  print("символ \(symbol) встретился 3 раза,  линия \(line + 1)")
                  totalPayout +=  3 * Int(payoutTable[symbol-1][0] * bet)
                  if symbol == 10 {
                    bonusCount = max(3, bonusCount)
                      print("Bыпало 3 бонуса")
                  }
              }
              
              if shape.filter({ $0 == symbol }).count == 4 {
                  print("символ \(symbol) встретился 4 раза,  линия \(line + 1)")
                  totalPayout +=  Int(payoutTable[symbol-1][1] * bet)
                  if symbol == 10 {
                      bonusCount = max(4, bonusCount)
                      print("Bыпало 4 бонуса")
                  }
              }
              
              if shape.filter({ $0 == symbol }).count == 5 {
                  print("символ \(symbol) встретился 5 раз, линия \(line + 1)")
                  totalPayout +=  Int(payoutTable[symbol-1][2] * bet)
                  
                  if symbol == 10 {
                      bonusCount = 5
                      print("Bыпало 5 бонусов!")
                  }
              }
              
              if shape.filter({ $0 == symbol }).count >= 3 {
                  luckyLinesDraw[line] = true
              }
          }
      }
      print("Total Payout: \(totalPayout)")
      currentPayout += totalPayout
      balance += totalPayout
      if isFreeSpin {
          freespinWin += totalPayout
      }
      print("*****HighLightMATRIX******")
      print("\(highlightMatrix)")
      
      print("*****CurrentMATRIX******")
      print("\(currentMatrix.debugDescription)")
  }
  
  private let lines: [[Int]] = [
      [2, 2, 2, 2, 2],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 0],
      [0, 1, 2, 1, 0],
      [2, 1, 0, 1, 2],
      [1, 0, 0, 0, 1],
      [1, 2, 2, 2, 1],
      [2, 2, 1, 0, 0],
      [0, 0, 1, 2, 2]
  ]
  
  func startAnimation() {
        currentIndex = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] _ in
            self?.updateRects()
        }
    }
    
    func updateRects() {
        while currentIndex < luckyLinesDraw.count {
            if luckyLinesDraw[currentIndex] {
                luckyRectDraw[currentIndex] = true
                currentIndex += 1
                break
            }
            currentIndex += 1
        }

        if currentIndex >= luckyLinesDraw.count {
            timer?.invalidate()
            timer = nil
            print("Animation complete")
        }
    }
  
  let payoutTable: [[Int]] = [
      [100, 1000, 5000],
      [40, 400, 2000],
      [30, 100, 750],
      [30, 100, 750],
      [5, 40, 150],
      [5, 40, 150],
      [5, 25, 100],
      [5, 25, 100],
      [5, 25, 100],
      [1, 1, 1]
  ]
  
  var tileCost: Int {
      switch currentTile {
      case 4: return 500
      case 5: return 3000
      default: return 0
      }
  }

  var bonusTileCost: Int {
      switch currentBonusTile {
      case 4: return 500
      case 5: return 3000
      default: return 0
      }
  }

  var bgCost: Int {
      switch currentBg {
      case 4: return 500
      case 5: return 3000
      default: return 0
      }
  }
  
  var isSlotReady: Bool {
    previewImage != nil &&
    !slotName.isEmpty &&
    (tileCost + bonusTileCost + bgCost) <= balance
  }
  
  // MARK: MATRIX LOGIC
  func fillItems(isFirst: Bool) {
      highlightMatrix = Array(repeating: Array(repeating: 0, count: 3), count: 5)
      highlightItemsMatrix = Array(repeating: Array(repeating: 0, count: 50), count: 5)
      probabilities = initialProbabilities
      let coolSlot = randomNumber(probabilities: probabilities)
      let coolSlot2 = randomNumber(probabilities: probabilities)
      if coolSlot < 8 {
          probabilities[coolSlot] *= 3
          probabilities[coolSlot2] *= 2
          print("Probabilities: \(probabilities)")
      }
      if isFreeSpin {
          probabilities[8] = 0
      }
      for j in 0...4 {
          for i in 0...49 {
              if isFirst || i < 47 {
                  itemsMatrix[j][i] = randomNumber(probabilities: probabilities) + 1
              }
          }
      }
  }
  
  func fillCurrentNew() {
      for i in 0...4 {
          for j in 0...2 {
              currentMatrix[i][j] = itemsMatrix[i][49 - j]
          }
      }
  }
  
  func randomNumber(probabilities: [Double]) -> Int {
      let sum = probabilities.reduce(0, +)
      let rnd = Double.random(in: 0.0 ..< sum)
      var accum = 0.0
      
      for (i, p) in probabilities.enumerated() {
          accum += p
          if rnd < accum {
              return i
          }
      }
      return (probabilities.count - 1)
  }
  
  
  // MARK: - Animation
  
  func startBalanceAnimation() {
      Timer
          .publish(every: 0.02, on: .main, in: .common)
          .autoconnect()
          .sink { [unowned self] _ in
              if balanceAnimCount < 1 {
                  balanceAnimCount += 0.02
              } else {
                  cancelTimers()
              }
          }
          .store(in: &cancellables)
  }
  
  func resetFreespins() {
      isFreeSpin = false
      freespinWin = 0
      freespins = 0
  }
  
  func cancelTimers() {
      for item in cancellables {
          item.cancel()
      }
  }
  // MARK: - Loading
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    $originalImage
      .map { [unowned self] image in
        downscaleImage(image: image)
      }
      .assign(to: &$previewImage)
  }
    // events = loadEventsFromFile() ?? []
  
  func resetvm() {
    currentTile = 1
    currentBonusTile = 1
    currentBg = 1
    showSlotInfo = false
    originalImage = nil
    previewImage = nil
    justCreated = false
    luckyLinesDraw = Array(repeating: false, count: 9)
  }
  
  // MARK: - Layout
  
  var h: CGFloat {
    size.height
  }
  
  var w: CGFloat {
    size.width
  }
  
  var header: CGFloat {
    isSEight ? -size.height*0.4 + 44 : -size.height*0.4
  }
  
  var isEightPlus: Bool {
    return size.width > 405 && size.height < 910 && size.height > 880 && UIDevice.current.name != "iPhone 11 Pro Max"
  }
  
  var isElevenProMax: Bool {
    UIDevice.current.name == "iPhone 11 Pro Max"
  }
  
  var isIpad: Bool {
    UIDevice.current.name.contains("iPad")
  }
  
  var isSE: Bool {
    return size.width < 380
  }
  
  var isSEight: Bool {
    return isSE || isEightPlus
  }
  
  // MARK: Image Processing:
  func downscaleImage(image: UIImage?, maxSize: CGSize = CGSize(width: 1024, height: 768)) -> UIImage? {
    guard let image = image,
          let cgImage = image.cgImage else { return nil }
    
    let boundingRect = CGRect(origin: .zero, size: maxSize)
    let resizedRect = AVMakeRect(aspectRatio: image.size, insideRect: boundingRect)
    let context = CGContext(data: nil,
                            width: Int(resizedRect.size.width),
                            height: Int(resizedRect.size.height),
                            bitsPerComponent: cgImage.bitsPerComponent,
                            bytesPerRow: 0,
                            space: cgImage.colorSpace ?? CGColorSpace(name: CGColorSpace.sRGB)!,
                            bitmapInfo: cgImage.bitmapInfo.rawValue)
    
    context?.interpolationQuality = .high
    context?.draw(cgImage, in: CGRect(origin: .zero, size: resizedRect.size))
    guard let scaledImage = context?.makeImage() else { return nil }
    
    return UIImage(cgImage: scaledImage)
  }
}
