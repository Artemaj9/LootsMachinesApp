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
  @Published var slots: [String] = []
  @Published var showBonus = false
  
  @Published var originalImage: UIImage? = UIImage(resource: .bg1)
  @Published var previewImage: UIImage? = UIImage(resource: .bg1)
  
  // MARK: SLOT CREATION
  @Published var currentTile = 1
  @Published var currentBonusTile = 1
  @Published var currentBg = 1
  @Published var slotName = ""
  
  @Published var bonusVariant = 1
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
