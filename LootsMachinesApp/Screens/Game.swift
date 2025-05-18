//
//  Game.swift
//

import SwiftUI

struct Game: View {
  @EnvironmentObject var nm: NavigationStateManager
  @EnvironmentObject var vm: GameViewModel
  let slot: Slot
  @State var enabledSpin = true
  @State var iteration = 1
  @State var startAnimation = false
  @State var showlines = false
   
  var slotHeight: Double = 100
  var scrollOffset: Double = 30
  
    var body: some View {
      ZStack {
        bg
        
        Image(.gametitlebg)
          .resizableToFit(height: 68)
          .overlay {
            LinearGradient(stops: [.init(color: Color(hex: "FFF866"), location: 0), .init(color: Color(hex: "FFB515"), location: 0.52), .init(color: Color(hex: "FFB515"), location: 1)], startPoint: .top, endPoint: .bottom)
              .mask {
                Text(slot.slotName)
                  .lootsFont(size: 21, style: .killjoy, color: .white)
              }
          }
          .overlay(.leading) {
            Button {
              nm.path.removeLast()
            } label: {
              Image(.infxbtn)
                .resizableToFit(height: 44)
            }
            .xOffset(-2)
          }
          .overlay(.trailing) {
            Button {
              withAnimation {
                vm.showSlotInfo = true
              }
            } label: {
              Image(.infobtn)
                .resizableToFit(height: 44)
            }
            .xOffset(12)
          }
          .yOffset(vm.header)
        Group {
          Rectangle()
            .fill(Color.white.opacity(0.1))
            .height(vm.h*0.4)
            .readSize($vm.tableSize)
                .overlay {
                    ZStack {
                      HStack {
                        ScrollView(showsIndicators: false) {
                          VStack(spacing: 0) {
                            ForEach(1..<51) { i in
                              ZStack {
                                Image("t\(slot.currentTile)\(vm.itemsMatrix[0][i-1])")
                                  .resizableToFit()
                                  .frame(width: vm.size.width/6, height: slotHeight)
                                  .offset(x: 4)
                              }
                            }
                          }
                          .offset(y: vm.newPosition[0])
                          .offset(y: -slotHeight * 46 + 30)
                          .offset(y: vm.size.width > 400 ? 6 : 0)
                          .offset(x: vm.size.height > 910 ? 4 : 0)
                          .offset(x: vm.size.height > 910 ? 4 : 0)
                        }
                        .allowsHitTesting(false)
                        
                        Image(.sep)
                          .resizableToFit()
                          .opacity(0.7)
                        
                        ScrollView(showsIndicators: false) {
                          VStack(spacing: 0) {
                            ForEach(1..<51) { i in
                              ZStack {
                                Image("t\(slot.currentTile)\(vm.itemsMatrix[1][i-1])")
                                  .resizableToFit()
                                  .frame(width: vm.size.width/6, height: slotHeight)
                                  .offset(x: 4)
                              }
                            }
                          }
                          .offset(y: vm.newPosition[1])
                          .offset(y: -slotHeight * 46 + 30)
                          .offset(y: vm.size.width > 400 ? 6 : 0)
                          .offset(x: vm.size.height > 910 ? 4 : 0)
                          .offset(x: vm.size.height > 910 ? 4 : 0)
                        }
                        .allowsHitTesting(false)
                        
                        Image(.sep)
                          .resizableToFit()
                          .opacity(0.7)
                        
                        ScrollView(showsIndicators: false) {
                          VStack(spacing: 0) {
                            ForEach(1..<51) { i in
                              ZStack {
                                Image("t\(slot.currentTile)\(vm.itemsMatrix[2][i-1])")
                                  .resizableToFit()
                                  .frame(width: vm.size.width/6, height: slotHeight)
                                  .offset(x: 4)
                              }
                            }
                          }
                          .offset(y: vm.newPosition[2])
                          .offset(y: -slotHeight * 46 + 30)
                          .offset(y: vm.size.width > 400 ? 6 : 0)
                          .offset(x: vm.size.height > 910  ? 4 : 0)
                          .offset(x: vm.size.height > 910  ? 4 : 0)
                        }
                        .allowsHitTesting(false)
                        
                        Image(.sep)
                          .resizableToFit()
                          .opacity(0.7)
                        
                        ScrollView(showsIndicators: false) {
                          VStack(spacing: 0) {
                            ForEach(1..<51) { i in
                              ZStack {
                                Image("t\(slot.currentTile)\(vm.itemsMatrix[3][i-1])")
                                  .resizableToFit()
                                  .frame(width: vm.size.width/6, height: slotHeight)
                                  .offset(x: 4)
                              }
                            }
                          }
                          .offset(y: vm.newPosition[3])
                          .offset(y: -slotHeight * 46 + 30)
                          .offset(y: vm.size.width > 400 ? 6 : 0)
                          .offset(x: vm.size.height > 910 ? 4 : 0)
                          .offset(x: vm.size.height > 910  ? 4 : 0)
                        }
                        .allowsHitTesting(false)
                        Image(.sep)
                          .resizableToFit()
                          .opacity(0.7)
                        
                        ScrollView(showsIndicators: false) {
                          VStack(spacing: 0) {
                            ForEach(1..<51) { i in
                              ZStack {
                                Image("t\(slot.currentTile)\(vm.itemsMatrix[4][i-1])")
                                  .resizableToFit()
                                  .frame(width: vm.size.width/6, height: slotHeight)
                                  .offset(x: 4)
                              }
                            }
                          }
                          .offset(y: vm.newPosition[4])
                          .offset(y: -slotHeight * 46 + 30)
                          .offset(y: vm.size.width > 400 ? 6 : 0)
                          .offset(x: vm.size.height > 910 ? 4 : 0)
                          .offset(x: vm.size.height > 910  ? 4 : 0)
                        }
                        .allowsHitTesting(false)
                      }
                        .offset(y: vm.size.width < 380 ? -16 : 0)
                        .offset(y: vm.size.width < 380 ? -16 : 0)
                        .scaleEffect(vm.size.height > 910 ? 1.03 : 1)
                        .scaleEffect(vm.size.height > 910  ? 1.07 : 1)
                        .scaleEffect(vm.size.height > 910 ? 1.07 : 1)
                        .scaleEffect(vm.size.height > 910 ? 1.08 : 1)
                        .offset(y: vm.size.height > 910 ? 16 : 0)
                        .offset(y: vm.size.height > 910 ? 16 : 0)
                        .offset(y: vm.size.height > 910  ? 12 : 0)
                    }
                    .mask {
                      Rectangle()
                        .height(vm.h*0.4)
                            .scaleEffect(x: vm.size.height > 910 ?  1.07 : 1)
                            .scaleEffect(x: vm.size.height > 910  ?  1.07 : 1)
                            .scaleEffect(y: vm.size.height > 910  ?  0.98 : 1)
                    }
                }
        }
        
        Button {
            if vm.isFreeSpin && vm.freespins > 0 {
                vm.freespins -= 1
            }
                withAnimation(.none) {
                 //   vm.luckyLinesDraw = Array(repeating: false, count: 40)
                   // vm.luckyRectDraw = Array(repeating: false, count: 40)
                    showlines = false
                }
            
                if iteration > 0 {
                    for j in 0...4 {
                        for i in 0...2 {
                            vm.itemsMatrix[j][49 - i] = vm.currentMatrix[j][i]
                        }
                        vm.newPosition[j] = 0
                    }
                    vm.fillItems(isFirst: false)
                }
                iteration += 1
                vm.balanceAnimCount = 0
                vm.isRotationWin = false
              
            if !vm.isFreeSpin {
                vm.startBalanceAnimation()
             //   vm.balance -= Int(vm.bet[vm.mode - 1])*vm.linesCount[vm.mode-1]
            }
                withAnimation {
                    enabledSpin = false
                }

                 vm.currentPayout = 0

            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
                    withAnimation {
                       enabledSpin = true
                        print("BALANCE: \(vm.balance)")
                        print("***CURRENT MATRIX***")
                        print(vm.currentMatrix[0])
                        print(vm.currentMatrix[1])
                        print(vm.currentMatrix[2])
                        print(vm.currentMatrix[3])
                      
            
                      //  vm.linesLogic()
                       // vm.dirtyWork()
                        
                        

                        if vm.currentPayout != 0 {
                            vm.isRotationWin = true
                            vm.balanceAnimCount = 0
                            vm.startBalanceAnimation()
                        }
                    }
                 //   vm.plusActiveCheck()
                 //   vm.linesPlusActiveCheck()


                
                    if vm.balance <= 100 {
                        vm.showBonus = true
                    }
                    print("*******")
                    showlines = true
                 //   vm.startAnimation()
                }
                
            Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { _ in
                
//                vm.plusActiveCheck()
//                vm.linesPlusActiveCheck()
//                
//                if vm.bonusMythCount == 3 {
//                    vm.isBonusGame = true
//                    vm.freespinAttempts = 1
//                } else if vm.bonusMythCount == 4 {
//                    vm.isBonusGame = true
//                    vm.freespinAttempts = 2
//                } else if vm.bonusMythCount == 5 {
//                    vm.isBonusGame = true
//                    vm.freespinAttempts = 3
//                }
//                
//                if vm.isFreeSpin && vm.freespins == 0 {
//                    vm.isGrandWin = true
//                    vm.startGradWinAnimation()
//                }
               // fix: enabledSpin = true
            }
                withAnimation(.spring(response: 1.8, dampingFraction: 0.8)) {
                    let newindex =  Int.random(in: 20...30)
                    vm.newPosition[0] = CGFloat( Int(slotHeight) * newindex)
                    vm.currentMatrix[0][0] = vm.itemsMatrix[0][49 - newindex]
                    vm.currentMatrix[0][1] = vm.itemsMatrix[0][49 - newindex - 1]
                    vm.currentMatrix[0][2] = vm.itemsMatrix[0][49 - newindex - 2]
                  //  vm.currentMatrix[0][3] = vm.itemsMatrix[0][49 - newindex - 3]
                 //   vm.newIndexes[0] = newindex
                }
                
                withAnimation(.spring(response: 1.7, dampingFraction: 0.7).delay(0.3)) {
                    let newindex =  Int.random(in: 20...30)
                    vm.newPosition[1] = CGFloat(Int(slotHeight)  * newindex)
                    vm.currentMatrix[1][0] = vm.itemsMatrix[1][49 - newindex]
                    vm.currentMatrix[1][1] = vm.itemsMatrix[1][49 - newindex - 1]
                    vm.currentMatrix[1][2] = vm.itemsMatrix[1][49 - newindex - 2]
                  //  vm.currentMatrix[1][3] = vm.itemsMatrix[1][49 - newindex - 3]
                  //  vm.newIndexes[1] = newindex
                }
                
                withAnimation(.spring(response: 1.7, dampingFraction: 0.8).delay(0.6)) {
                    let newindex =  Int.random(in: 20...30)
                    vm.newPosition[2] = CGFloat(Int(slotHeight)  * newindex)
                    vm.currentMatrix[2][0] = vm.itemsMatrix[2][49 - newindex]
                    vm.currentMatrix[2][1] = vm.itemsMatrix[2][49 - newindex - 1]
                    vm.currentMatrix[2][2] = vm.itemsMatrix[2][49 - newindex - 2]
//                    vm.currentMatrix[2][3] = vm.itemsMatrix[2][49 - newindex - 3]
                //    vm.newIndexes[2] = newindex
                }
                
                withAnimation(.spring(response: 1.5, dampingFraction: 0.8).delay(0.9)) {
                    let newindex =  Int.random(in: 20...30)
                    vm.newPosition[3] = CGFloat(Int(slotHeight)  * newindex)
                    vm.currentMatrix[3][0] = vm.itemsMatrix[3][49 - newindex]
                    vm.currentMatrix[3][1] = vm.itemsMatrix[3][49 - newindex - 1]
                    vm.currentMatrix[3][2] = vm.itemsMatrix[3][49 - newindex - 2]
                  //  vm.currentMatrix[3][3] = vm.itemsMatrix[3][49 - newindex - 3]
                 //   vm.newIndexes[3] = newindex
                }
                
                withAnimation(.spring(response: 1.5, dampingFraction: 0.8).delay(1.2)) {
                    let newindex =  Int.random(in: 20...30)
                  
                    vm.newPosition[4] = CGFloat(Int(slotHeight) * newindex)
                    vm.currentMatrix[4][0] = vm.itemsMatrix[4][49 - newindex]
                    vm.currentMatrix[4][1] = vm.itemsMatrix[4][49 - newindex - 1]
                    vm.currentMatrix[4][2] = vm.itemsMatrix[4][49 - newindex - 2]
                   // vm.currentMatrix[4][3] = vm.itemsMatrix[4][49 - newindex - 3]
                  //  vm.newIndexes[4] = newindex
                }
        } label: {
            Image(.spin)
                .resizableToFit()
                .padding(.horizontal, 24)
                .padding(.horizontal, vm.size.width < 380 ? 16 : 0)
        }
        .opacity(enabledSpin && !vm.isFreeSpin ? 1 : 0.5 )
       // .disabled(!enabledSpin ||  ((Int(vm.bet[vm.mode - 1]*vm.linesCount[vm.mode-1]) > vm.balance) && !vm.isFreeSpin))
       // .opacity((Int(vm.bet[vm.mode - 1]*vm.linesCount[vm.mode-1]) > vm.balance && !vm.isFreeSpin) ? 0.5 : 1)
       // .animation(.easeInOut, value: vm.bet[vm.mode - 1]*vm.linesCount[vm.mode-1])
        .animation(.easeInOut, value: enabledSpin)
        .yOffset(vm.h*0.35)

        SlotInfo(slot: slot)
          .transparentIfNot(vm.showSlotInfo)
          .animation(.easeInOut, value: vm.showSlotInfo)
      }
      .onAppear {
        vm.fillItems(isFirst: true)
        vm.fillCurrentNew()
      }
    }
  
  private var bg: some View {
    Image("bg\(slot.currentBg)")
      .backgroundFill()
      .scaleEffect(1.05)
  }
}

#Preview {
  Game(
    slot: Slot(
      currentTile: 1,
      currentBonusTile: 1,
      currentBg: 1,
      bonusVariant: 1,
      slotName: "Name",
      image: nil
    )
  )
    .vm
    .nm
}
