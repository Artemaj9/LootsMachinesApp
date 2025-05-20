//
//  SlotInfo.swift
//

import SwiftUI

struct SlotInfo: View {
  @EnvironmentObject var vm: GameViewModel
  @EnvironmentObject var nm: NavigationStateManager
  
  let slot: Slot
    var body: some View {
      ZStack {
        bg
        header
        bonusgame
        VStack {
          ForEach(0..<3) { i in
            HStack {
              ForEach(0..<3) { j in
                Image("tier\(9 - j - 3*i)")
                  .resizableToFit()
                  .overlay(alignment: .top) {
                    Image("t\(slot.currentTile)\(9 - j - 3*i)")
                      .resizableToFit(height: 75)
                      .yOffset(8)
                  }
              }
            }
          }
        }
        .hPadding(8)
      }
      .ignoresSafeArea()
    }
  
  private var bg: some View {
    Image("bg\(slot.currentBg)")
      .backgroundFill()
      .scaleEffect(1.01)
  }
  
  private var header: some View {
    Image(.slotinfo)
      .resizableToFit(width: vm.w*0.8)
      .overlay(.leading) {
        Button {
          withAnimation {
            vm.showSlotInfo = false
          }
        } label: {
          Image(.infxbtn)
            .resizableToFit(height: 40)
        }
        .xOffset(-10)
      }
      .yOffset(vm.header)
  }
  
  private var bonusgame: some View {
    HStack {
      Image("btitle\(slot.currentBonusTile)")
        .resizableToFit(height: vm.isSEight ? 100 : 124)
      
      Image(.bonusgame)
        .resizableToFit(height: vm.isSEight ? 160 : 180)
    }
    .hPadding()
    .yOffset(vm.h*0.4)
    .yOffsetIf(vm.isSEight, -30)
  }
}

#Preview {
  SlotInfo(slot: Slot(currentTile: 1, currentBonusTile: 1, currentBg: 2, slotName: "Ok", image: nil))
    .nm
    .vm
}
