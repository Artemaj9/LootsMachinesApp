//
//  CreateSlot.swift
//

import SwiftUI

struct CreateSlot: View {
  @EnvironmentObject var nm: NavigationStateManager
  @EnvironmentObject var vm: GameViewModel
  
    var body: some View {
        Text("Create slot")
    }
}

#Preview {
    CreateSlot()
}
