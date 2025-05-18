//
//  DailyBonus.swift
//

import SwiftUI

struct DailyBonus: View {
  @EnvironmentObject var vm: GameViewModel
  @State private var startAnimation = false
  
  var body: some View {
    ZStack {
      Color(hex: "1C0035").opacity(0.8)
        .ignoresSafeArea()
        .onTapGesture {
          vm.showBonus = false
        }
      
      Image(.mysteriousglow)
        .resizableToFill()
        .opacity(startAnimation ? 0.7 : 0)
        .blendMode(.screen)
        .blendMode(.luminosity)
        .animation(.easeIn(duration: 1), value: startAnimation)
      
      Image(.bgrays)
        .resizableToFit()
        .opacity(0.5)
        .mask {
          RadialGradient(stops: [.init(color: .white, location: 0), .init(color: .white.opacity(0), location: 0.6)], center: .center, startRadius: 10, endRadius: startAnimation ? 300 : 10)
        }
        .blendMode(.luminosity)
        .scaleEffect(startAnimation ? 2 : 1)
        .animation(.easeIn(duration: 3), value: startAnimation)
      
      Image(.bonus)
        .resizableToFit()
        .hPadding()
      
      Button {
        vm.showBonus = false
      } label: {
        Text("TAP TO CONTINUE")
          .lootsFont(size: 18, style: .killjoy, color: .white)
          .tappableBg()
      }
      .yOffset(vm.h*0.35)
      .transparentIfNot(startAnimation)
      .animation(.easeIn(duration: 1).delay(0.7), value: startAnimation)
    }
    .onAppear {
      startAnimation = true
    }
  }
}

#Preview {
  DailyBonus()
    .vm
}
