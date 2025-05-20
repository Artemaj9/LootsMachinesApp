//
//  GameViewModel.swift
//

import SwiftUI
import Combine
import func AVFoundation.AVMakeRect

final class GameViewModel: ObservableObject {
  @Published var size: CGSize = CGSize(width: 393, height: 851)
  @Published var isSplash = true
  @AppStorage("balance") var balance = 10000
  @Published var slots: [Slot] = [
    Slot(
      currentTile: 1,
      currentBonusTile: 2,
      currentBg: 3,
      bonusVariant: 1,
      slotName: "klklkk",
      image: UIImage(resource: .bg2)
    ),
    Slot(
      currentTile: 1,
      currentBonusTile: 2,
      currentBg: 3,
      bonusVariant: 2,
      slotName: "klkldddkk",
      image: UIImage(resource: .bg3)
    ),
    
    Slot(
      currentTile: 1,
      currentBonusTile: 2,
      currentBg: 4,
      bonusVariant: 2,
      slotName: "klkldddkk",
      image: UIImage(resource: .bg4)
    )
  ]
  @Published var showBonus = false
  
  @Published var originalImage: UIImage? = nil
  @Published var previewImage: UIImage? = nil
  @Published var showSlotInfo = false
  @Published var showDelete = false
  
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
  @Published var bet = 10
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
  @Published var lastWin = 0
  
  private var initialProbabilities: [Double] = [1, 1, 2, 3, 4, 5, 6, 7, 8, 10]
  private var probabilities: [Double] = [1, 1, 2, 3, 4, 5, 6, 7, 8, 10]
  
  @Published var isFreeSpin = false
  @Published var freespinWin = 0
  @Published var bonusCount = 0
  
  // MARK: Timer daily
  @Published var nowDate = Date()
  @AppStorage("lastDate") var lastDate = 0
  @Published var dailyBonus = 1000
  @Published var timeCount = 0
  @Published var timeRemaining = ""
  @AppStorage("isBonusReady") var isBonusReady = true
  var countdownTime: TimeInterval = 24 * 3600
  var cancellable: AnyCancellable?
  @Published var slotToDel = Slot()
  
  func startBonusTimer() {
        let lastSavedTime = UserDefaults.standard.object(forKey: "countdownEndTime") as? Date
        let now = Date()
        
        if let lastSavedTime = lastSavedTime {
            let timeLeft = lastSavedTime.timeIntervalSince(now)
            if timeLeft > 0 {
                countdownTime = timeLeft
            } else {
                isBonusReady = true
                timeRemaining = "00:00:00"
                return
            }
        } else {
            let countdownEndTime = now.addingTimeInterval(countdownTime)
            UserDefaults.standard.set(countdownEndTime, forKey: "countdownEndTime")
        }
      
        cancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateTimer()
            }
    }

  func updateTimer() {
          let now = Date()
          let countdownEndTime = UserDefaults.standard.object(forKey: "countdownEndTime") as? Date ?? now
          let timeInterval = countdownEndTime.timeIntervalSince(now)
          
          if timeInterval <= 0 {
              isBonusReady = true
              timeRemaining = "00:00:00"
              cancellable?.cancel()
          } else {
              let hours = Int(timeInterval) / 3600
              let minutes = (Int(timeInterval) % 3600) / 60
              let seconds = Int(timeInterval) % 60
              timeRemaining = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
          }
      }
  
  func collectBonus() {
      let now = Date()
      let nextBonusTime = now.addingTimeInterval(24 * 3600) // 24 hours from now

      UserDefaults.standard.set(now, forKey: "lastBonusTime")
      UserDefaults.standard.set(nextBonusTime, forKey: "countdownEndTime")

      balance += dailyBonus
      isBonusReady = false
      timeRemaining = "24:00:00"

      // Cancel and restart the timer
      cancellable?.cancel()
      countdownTime = 24 * 3600
      startBonusTimer()
  }
  
  // MARK: Bonus Game
  @Published var isBonusGame = false
  @Published var bonusGameState = 1
  @Published var bonusWin = [0, 0, 0]
  @Published var bonusUserSelection = 1
  @Published var showBigWin = false
  
  func generateBonusWin(for variant: Int) {
      switch variant {
      case 1:
          var wins = [0, 0, 0]
          let winIndex = Int.random(in: 0..<3)
          wins[winIndex] = 15
          self.bonusWin = wins
      case 2:
          var rewards = [10, 5, 0].shuffled()
          self.bonusWin = rewards
      default:
          self.bonusWin = [0, 0, 0]
      }
  }
  
  func handleBonusSelection() {
      let index = bonusUserSelection - 1
      let reward = bonusWin[safe: index] ?? 0
    if reward > 0 {
        self.freespins += reward
    }
    
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
          self.isBonusGame = false
          self.bonusGameState = 1
          self.bonusUserSelection = 0
      }
  }
  
  var currentIndex = 0
  var timer: Timer?
  
  // MARK: Lines Logic
  @Published var currentWin = 0
  @Published var linesCount = 3
  @Published var luckyLinesDraw = Array(repeating: false, count: 9) // was false
  @Published var luckyRectDraw = Array(repeating: false, count: 9) // was false
  
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
                    isBonusGame = true
                  }
              }
              
              if shape.filter({ $0 == symbol }).count == 4 {
                  print("символ \(symbol) встретился 4 раза,  линия \(line + 1)")
                  totalPayout +=  Int(payoutTable[symbol-1][1] * bet)
                  if symbol == 10 {
                      bonusCount = max(4, bonusCount)
                      print("Bыпало 4 бонуса")
                    isBonusGame = true
                  }
              }
              
              if shape.filter({ $0 == symbol }).count == 5 {
                  print("символ \(symbol) встретился 5 раз, линия \(line + 1)")
                  totalPayout +=  Int(payoutTable[symbol-1][2] * bet)
                  
                  if symbol == 10 {
                      bonusCount = 5
                      print("Bыпало 5 бонусов!")
                    isBonusGame = true
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
      lastWin = totalPayout
    if totalPayout >= 5000 {
      showBigWin = true
    }
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
          probabilities[coolSlot] *= 2
          probabilities[coolSlot2] *= 2
          print("Probabilities: \(probabilities)")
      }
    if freespins > 0 {
          probabilities[9] = 0
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
    
    startBonusTimer()
  //  slots = loadSlotsFromFile() ?? []
  }
  // MARK: Debug
  func showAllLines() {
      luckyLinesDraw = Array(repeating: true, count: 9)
      luckyRectDraw = Array(repeating: true, count: 9)
  }
  func resetvm() {
    currentTile = 1
    currentBonusTile = 1
    currentBg = 1
    slotName = ""
    showSlotInfo = false
    originalImage = nil
    previewImage = nil
    justCreated = false
    showBigWin = false
    luckyLinesDraw = Array(repeating: false, count: 9)
    freespins = 0
    bet = 10
    linesCount = 3
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
