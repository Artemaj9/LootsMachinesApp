//
//  History.swift
//

import SwiftUI

struct History: View {
  @EnvironmentObject var nm: NavigationStateManager
  @EnvironmentObject var vm: GameViewModel
  
  var body: some View {
    ZStack {
      bg
      title
      xbtn
      
      if vm.slots.isEmpty {
        Text("NO SLOTS YET")
          .lootsFont(size: 27, style: .killjoy, color: .white)
      } else {
        ScrollView {
          VStack(alignment: .leading, spacing: 16) {
            Color.clear.height(50)
            ForEach(vm.slots.chunked(into: 2), id: \.self) { row in
              HStack(spacing: 16) {
                ForEach(row, id: \.self) { slot in
                  SlotCell(slot: slot)
                    .frame(maxWidth: .infinity)
                }
                
                if row.count == 1 {
                  Spacer()
                }
              }
            }
            Color.clear.height(250)
          }
          .padding()
        }
        .scrollMask(0.1, 0.9)
        .yOffset(vm.h*0.15)
        
      }
      
      ZStack {
        if vm.showDelete {
          Delete()
        }
      }
      .transparentIfNot(vm.showDelete)
      .animation(.easeIn, value: vm.showDelete)
      
    }
    .navigationBarBackButtonHidden()
  }
  
  private var bg: some View {
    Image(.bg)
      .backgroundFill()
  }
  
  private var title: some View {
    Image(.historytitle)
      .resizableToFit(height: 70)
      .yOffset(vm.header)
  }
  
  private var xbtn: some View {
    HStack {
      Button {
        nm.path = []
      } label: {
        Image(.xbtn)
          .resizableToFit(height: 42)
      }
      .yOffset(vm.header)
      
      Spacer()
    }
    .hPadding()
  }
}

#Preview {
  History()
    .nm
    .vm
}
