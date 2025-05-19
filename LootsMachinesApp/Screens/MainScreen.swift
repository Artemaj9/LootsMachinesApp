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
        browseSlots
        dailyBonus
        
        HStack {
          if let lastSlot = vm.slots[safe: 0] {
            SlotCell(slot: lastSlot)
          }
          if let plastSlot =  vm.slots[safe: 1] {
            SlotCell(slot: plastSlot)
          }

          
          if let plastSlot =  vm.slots[safe: 1] {
            Image(.slotcell)
              .resizableToFit(height: 200)
              .overlay(.top) {
                RoundedRectangle(cornerRadius: 24)
                  .overlayMask {
                    Image(uiImage: plastSlot.image ?? UIImage(resource: .bg2))
                      .resizableToFill()
                  }
                  .hPadding(4)
                  .height(160)
              }
              .overlay(.bottom) {
                Button {
                  nm.path.append(.game(plastSlot))
                } label: {
                  Image(.playbtn)
                    .resizableToFit(height: 44)
                }
              }
          }
        }
        
        Delete()
          .transparentIfNot(vm.showDelete)
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
