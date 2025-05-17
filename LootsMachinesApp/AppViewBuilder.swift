//
//  AppViewBuilder.swift
//

import SwiftUI

struct AppViewBuilder<Splash: View, MainScreen: View>: View {
  @Binding var isSplash: Bool
  @ViewBuilder let splash: Splash
  @ViewBuilder let mainScreen: MainScreen
  
  var body: some View {
    ZStack {
      if isSplash {
        splash
          .transition(.opacity)
      } else {
        mainScreen
          .transition(.opacity)
      }
    }
    .animation(.smooth, value: isSplash)
    .ignoresSafeArea()
  }
}
