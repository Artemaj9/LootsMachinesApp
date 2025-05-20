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
      
      if vm.slots.isEmpty {
        Text("NO SLOTS YET")
          .lootsFont(size: 27, style: .killjoy, color: .white)
      } else {
        ScrollView {
          VStack(alignment: .leading, spacing: 32) {
            Color.clear.height(50)
            let rows = vm.slots.chunked(into: 2)
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: 20) {
                    let row = rows[rowIndex]

                    if row.count == 1 {
                        SlotCell(slot: row[0])
                        Spacer() 
                    } else {
                        ForEach(row.indices, id: \.self) { idx in
                            if let slot = row[safe: idx] {
                                SlotCell(slot: slot)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
            }
            Color.clear.height(250)
          }
          .padding()
        }
        .scrollMask(0.1, 0.9)
        .yOffset(vm.h*0.12)
        .yOffsetIf(vm.isSEight, 30)
      }
      
      xbtn
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
