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
  
  // MARK: - Game
  @Published var tableSize: CGSize = .zero
  @Published var isFirstSpin = true
  @Published var freespins = 0
  
  
  @Published var currentPayout = 0
  @Published var bet = [500, 500, 500, 500]
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
              if isFirst || i < 46 {
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
