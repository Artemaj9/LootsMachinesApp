//
//  Delete.swift
//

import SwiftUI

struct Delete: View {
  @EnvironmentObject var vm: GameViewModel
  
    var body: some View {
      ZStack {
        Color(hex: "1C0035").opacity(0.8)
          .ignoresSafeArea()
        
        Image(.delslotbg)
          .resizableToFit()
          .overlay(.bottom) {
            HStack {
              Button {
                vm.showDelete = false
              } label: {
                Image(.bbtn)
                  .resizableToFit(height: 54)
              }
              
              Button {
                // delete
                if let index = vm.slots.firstIndex(where: {$0 == vm.slotToDel}) {
                  vm.slots.remove(at: index)
                  saveSlotsToFile(slots: vm.slots)
                }
                vm.showDelete = false
              } label: {
                Image(.deletbtn)
                  .resizableToFit(height: 54)
              }
            }
            .yOffset(20)
          }
          .hPadding()
      }
    }
}

#Preview {
  Delete()
    .vm
}
