//
//  Splash.swift
//

import SwiftUI

struct Splash: View {
  @EnvironmentObject var vm: GameViewModel
  
  var body: some View {
    ZStack {
      Image(.splash)
        .backgroundFill()
        .readSize($vm.size)
    }
    .task {
      try? await Task.sleep(nanoseconds: 10_000_000)
      withAnimation { vm.isSplash = false }
    }
  }
}
