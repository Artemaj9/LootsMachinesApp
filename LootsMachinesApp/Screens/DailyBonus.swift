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
        .frame(width: vm.w)
      
      Image(.bgrays)
        .resizableToFit()
        .opacity(0.5)
        .mask {
          RadialGradient(stops: [.init(color: .white, location: 0), .init(color: .white.opacity(0), location: 0.6)], center: .center, startRadius: 10, endRadius: startAnimation ? 300 : 10)
        }
        .blendMode(.luminosity)
        .scaleEffect(startAnimation ? 2 : 1)
        .animation(.easeIn(duration: 3), value: startAnimation)
      
      Image(.wintxtbg)
        .resizableToFit(height: 88)
        .hPadding()
        .overlay {
          Text(vm.isBonusReady ? "1000" : vm.timeRemaining)
            .lootsFont(size: 46, style: .killjoy, color: .white)
            .overlayMask {
              LinearGradient(stops: [.init(color: Color(hex: "FFF866"), location: 0.2), .init(color: Color(hex: "FFB515"), location: 0.52), .init(color: Color(hex: "FFEB05"), location: 0.9)], startPoint: .top, endPoint: .bottom)
            }
        }
      
      Button {
        vm.showBonus = false
        if vm.isBonusReady {
          vm.collectBonus()
        }
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
