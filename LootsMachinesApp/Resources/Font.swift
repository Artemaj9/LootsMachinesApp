//
//  Font.swift
//

import SwiftUI

enum CustomFont: String {
  case killjoy = "CCKillJoy Regular"
  case gilroyBold = "Gilroy-Bold"
  case gilroyBlack = "Gilroy-Black"
}

extension Font {
  static func custom(_ font: CustomFont, size: CGFloat) -> Font {
    Font.custom(font.rawValue, size: size)
  }
}
