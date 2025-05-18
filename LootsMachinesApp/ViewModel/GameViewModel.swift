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
  
  // MARK: SLOT CREATION
  @Published var currentTile = 1
  @Published var currentBonusTile = 1
  @Published var currentBg = 1
  
  // MARK: - Loading
  private var cancellables = Set<AnyCancellable>()
  
  init() {
   // events = loadEventsFromFile() ?? []
  }
  
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
}
