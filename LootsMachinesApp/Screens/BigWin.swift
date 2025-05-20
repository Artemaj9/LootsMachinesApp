//
//  BigWin.swift
//

import SwiftUI

struct BigWin: View {
  @EnvironmentObject var vm: GameViewModel
  @State private var startAnimation = false
  
  var body: some View {
    ZStack {
      Color(hex: "1C0035").opacity(0.8)
        .ignoresSafeArea()
      
      Image(.youwin)
        .resizableToFit(height: 150)
        .yOffset(-vm.h*0.2)
      
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
      
      LinearGradient(stops: [.init(color: Color(hex: "FFF866"), location: 0.2), .init(color: Color(hex: "FFB515"), location: 0.52), .init(color: Color(hex: "FFEB05"), location: 0.9)], startPoint: .top, endPoint: .bottom)
        .height(50)
        .mask {
          Text("\(vm.lastWin)")
            .lootsFont(size: 46, style: .killjoy, color: .white)
        }

      Text("TAP TO CONTINUE")
        .lootsFont(size: 18, style: .killjoy, color: .white)
        .transparentIfNot(startAnimation)
        .animation(.easeInOut.delay(0.7), value: startAnimation)
        .yOffset(vm.h*0.15)
      
      Image(.goldzal)
        .resizableToFit()
        .yOffset(vm.h*0.4)
        .yOffsetIf(vm.isSEight, -20)
    }
    .onTapGesture {
      withAnimation {
        vm.showBigWin = false
      }
    }
    .onAppear {
      startAnimation = true
    }
  }
}

#Preview {
    BigWin()
    .vm
}
