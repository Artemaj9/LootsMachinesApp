//
//  Info.swift
//

import SwiftUI

struct Info: View {
  @EnvironmentObject var nm: NavigationStateManager
  @EnvironmentObject var vm: GameViewModel
  
  var body: some View {
    ZStack {
      bg
      infotxt
      backbtn
    }
    .navigationBarBackButtonHidden()
  }
  
  private var bg: some View {
    Image(.bg)
      .backgroundFill()
  }
  
  private var infotxt: some View {
    ScrollView {
      VStack(spacing: 16) {
        Color.clear.height(20)
        
        Text("ABOUT APP")
          .lootsFont(size: 27, style: .killjoy, color: .white)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Text(Txt.info)
          .lootsFont(size: 18, style: .gilroyBold, color: .white)
          .padding(.bottom, 12)
        
        Text("Disclaimer")
          .lootsFont(size: 27, style: .killjoy, color: .white)
          .frame(maxWidth: .infinity, alignment: .leading)
        
        Text(Txt.disclaimer)
          .lootsFont(size: 18, style: .gilroyBold, color: .white)
        
        Color.clear.height(200)
      }
      .hPadding()
    }
    .height(vm.h*0.8)
    .scrollMask(0.07, 0.9)
    .yOffset(-vm.h*0.04)
    .yOffsetIf(vm.isSEight, 8)
  }
  
  private var backbtn: some View {
    Button {
      nm.path = []
    } label: {
      Image(.backbtn)
        .resizableToFit(height: 46)
    }
    .vPadding(20)
    .yOffset(vm.h*0.4)
    .yOffsetIf(vm.isSEight, -40)
  }
}

#Preview {
  Info()
    .nm
    .vm
}
