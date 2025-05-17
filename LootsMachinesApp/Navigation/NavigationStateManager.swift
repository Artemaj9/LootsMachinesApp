//
//  NavigationStateManager.swift
//

import SwiftUI

enum SelectionState: Hashable, Codable {
  case info
  case create
  case prize
  case history
}

class NavigationStateManager: ObservableObject {
  @Published var path = [SelectionState]()
}

extension View {
  func addNavigationRoutes(path: Binding<[SelectionState]>) -> some View {
    NavigationStack(path: path) {
      self.navigationDestination(for: SelectionState.self) { state in
        if state == .info {
          Info()
        }
        
        if state == .create {
          CreateSlot()
        }
        
        if state == .prize {
          DailyBonus()
        }
        
        if state == .history {
          History()
        }
      }
    }
  }
}
