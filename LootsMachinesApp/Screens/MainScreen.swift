//
//  MainScreen.swift
//

import SwiftUI

struct MainScreen: View {
  @EnvironmentObject var nm: NavigationStateManager
  @EnvironmentObject var vm: GameViewModel
  
  var body: some View {
      ZStack {
        bg
        header
        createSlot
        HStack {
          VStack(alignment: .leading) {
            Text("BROWSE YOUR")
              .lootsFont(size: 21, style: .killjoy, color: .white)
            Text("SLOTS")
              .lootsFont(size: 27, style: .killjoy, color: .white)
          }
          
          Spacer()
          
          Button {
            nm.path.append(.history)
          } label: {
            Image(.seeallbtn)
              .resizableToFit(height: 48)
          }
        }
        .hPadding()
        .yOffset(vm.h*0.1)
      }
      .addNavigationRoutes(path: $nm.path)
  }
  
  private var bg: some View {
    Image(.bg)
      .backgroundFill()
  }
  
  private var header: some View {
    HStack(alignment: .top) {
      VStack(alignment: .leading, spacing: 8) {
        HStack {
          Text("\(String(vm.balance))")
            .lootsFont(size: 30, style: .killjoy, color: .white)
            .customStroke(color: Color(hex: "610667"), width: 2)
          
          Image(.coins)
            .resizableToFit(height: 24)
        }
        
        Text("BALANCE")
          .lootsFont(size: 15, style: .gilroyBlack, color: .white)
          .xOffset(8)
      }
      
      Spacer()
      
      HStack(spacing: 20) {
        Button {
          nm.path.append(.info)
        } label: {
          Image(.infobtn)
            .resizableToFit(height: 36)
        }
        
        Button {
          nm.path.append(.prize)
        } label: {
          Image(.prizebtn)
            .resizableToFit(height: 54)
        }
      }
    }
    .hPadding()
   .yOffset(vm.header)
  }
  
  private var createSlot: some View {
    Image(.logomain)
      .resizableToFit()
      .hPadding()
      .overlay(.bottom) {
        Button {
          nm.path.append(.create)
        } label: {
          Image(.createbtn)
            .resizableToFit(width: vm.w*0.8)
        }
        .yOffset(20)
      }
      .yOffset(-vm.h*0.18)
  }
}

#Preview {
  MainScreen()
    .nm
    .vm
}
