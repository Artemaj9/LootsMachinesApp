//
//  ContentView.swift
//
// swiftlint:disable all

import SwiftUI

struct ContentView: View {
  @StateObject var vm = GameViewModel()
  @StateObject var nm = NavigationStateManager()
  
  var body: some View {
    AppViewBuilder(
      isSplash: $vm.isSplash,
      splash: { Splash().env(vm) },
      mainScreen: { MainScreen().env(vm,nm) }
    )
  }
}
