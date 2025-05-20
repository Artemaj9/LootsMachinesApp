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
      createSlot
      header
      browseSlots
  
      
      if vm.slots.isEmpty {
        Text("NO SLOTS YET")
          .lootsFont(size: 27, style: .killjoy, color: .white)
          .yOffset(vm.h*0.3)
      } else {
        HStack(spacing: 20) {
          if let lastSlot = vm.slots[safe: 0] {
            SlotCell(slot: lastSlot)
          }
          if let plastSlot =  vm.slots[safe: 1] {
            SlotCell(slot: plastSlot)
          }
        }
        .yOffset(vm.h*0.3)
        .yOffsetIf(vm.isSEight, -40)
      }
      
      dailyBonus
        
        Delete()
          .transparentIfNot(vm.showDelete)
      }
      .addNavigationRoutes(path: $nm.path)
      .onAppear {
        vm.resetvm()
      }
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
          vm.showBonus = true
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
  
  private var browseSlots: some View {
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
    .yOffsetIf(vm.isSEight, -20)
  }
  
  private var dailyBonus: some View {
    ZStack {
      if vm.showBonus {
        DailyBonus()
      }
    }
    .transparentIfNot(vm.showBonus)
    .animation(.easeInOut, value: vm.showBonus)
  }
}

#Preview {
  MainScreen()
    .nm
    .vm
}
