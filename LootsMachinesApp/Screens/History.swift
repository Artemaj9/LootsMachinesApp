//
//  History.swift
//

import SwiftUI

struct History: View {
  @EnvironmentObject var nm: NavigationStateManager
  @EnvironmentObject var vm: GameViewModel
  @State private var showDelete = false
  
  var body: some View {
    ZStack {
      bg
      title
      xbtn
      
      if vm.slots.isEmpty {
        Text("NO SLOTS YET")
          .lootsFont(size: 27, style: .killjoy, color: .white)
          .onTapGesture {
            showDelete = true
          }
      } else {
        Text("Slots")
          .lootsFont(size: 27, style: .killjoy, color: .white)
        
      }
      
      ZStack {
        if showDelete {
          Delete(showDelete: $showDelete)
        }
      }
      .transparentIfNot(showDelete)
      .animation(.easeIn, value: showDelete)
      
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
