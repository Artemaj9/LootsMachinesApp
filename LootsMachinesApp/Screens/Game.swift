//
//  Game.swift
//

import SwiftUI

struct Game: View {
  @EnvironmentObject var nm: NavigationStateManager
  @EnvironmentObject var vm: GameViewModel
  let slot: Slot
  @State private var enabledSpin = true
  @State private var iteration = 1
  @State private var startAnimation = false
  @State private var showlines = false
  @State private var showPicker = false
   
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
              if vm.justCreated {
                nm.path = []
                vm.resetvm()
              } else {
                nm.path.removeLast()
                vm.resetvm()
              }
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
        
        ZStack {
          Rectangle()
            .fill(Color.white.opacity(0.001))
            .height(vm.h*0.4)
            .readSize($vm.tableSize)
                .overlay {
                    ZStack {
                      HStack {
                        ScrollView(showsIndicators: false) {
                          VStack(spacing: 0) {
                            ForEach(1..<51) { i in
                              ZStack {
                                Image(vm.itemsMatrix[0][i-1] != 10 ? "t\(slot.currentTile)\(vm.itemsMatrix[0][i-1])" : "tb\(slot.currentBonusTile)")
                                  .resizableToFit()
                                  .frame(width: vm.size.width/6, height: slotHeight)
                                  .offset(x: 4)
                              }
                            }
                          }
                          .offset(y: vm.newPosition[0])
                          .offset(y: -slotHeight * 47 + 30)
                          .offset(y: vm.size.width > 400 ? 6 : 0)
                        }
                        .allowsHitTesting(false)
                        
                        Image(.sep)
                          .resizableToFill()
                          .opacity(0.7)
                        
                        ScrollView(showsIndicators: false) {
                          VStack(spacing: 0) {
                            ForEach(1..<51) { i in
                              ZStack {
                                Image(vm.itemsMatrix[1][i-1] != 10 ? "t\(slot.currentTile)\(vm.itemsMatrix[1][i-1])" : "tb\(slot.currentBonusTile)")
                                  .resizableToFit()
                                  .frame(width: vm.size.width/6, height: slotHeight)
                                  .offset(x: 4)
                              }
                            }
                          }
                          .offset(y: vm.newPosition[1])
                          .offset(y: -slotHeight * 47 + 30)
                          .offset(y: vm.size.width > 400 ? 6 : 0)
                        }
                        .allowsHitTesting(false)
                        
                        Image(.sep)
                          .resizableToFill()
                          .opacity(0.7)
                        
                        ScrollView(showsIndicators: false) {
                          VStack(spacing: 0) {
                            ForEach(1..<51) { i in
                              ZStack {
                                Image(vm.itemsMatrix[2][i-1] != 10 ? "t\(slot.currentTile)\(vm.itemsMatrix[2][i-1])" : "tb\(slot.currentBonusTile)")
                                  .resizableToFit()
                                  .frame(width: vm.size.width/6, height: slotHeight)
                                  .offset(x: 4)
                              }
                            }
                          }
                          .offset(y: vm.newPosition[2])
                          .offset(y: -slotHeight * 47 + 30)
                          .offset(y: vm.size.width > 400 ? 6 : 0)
                        }
                        .allowsHitTesting(false)
                        
                        Image(.sep)
                          .resizableToFill()
                          .opacity(0.7)
                        
                        ScrollView(showsIndicators: false) {
                          VStack(spacing: 0) {
                            ForEach(1..<51) { i in
                              ZStack {
                                Image(vm.itemsMatrix[3][i-1] != 10 ? "t\(slot.currentTile)\(vm.itemsMatrix[3][i-1])" : "tb\(slot.currentBonusTile)")
                                  .resizableToFit()
                                  .frame(width: vm.size.width/6, height: slotHeight)
                                  .offset(x: 4)
                              }
                            }
                          }
                          .offset(y: vm.newPosition[3])
                          .offset(y: -slotHeight * 47 + 30)
                          .offset(y: vm.size.width > 400 ? 6 : 0)
//                          .offset(x: vm.size.height > 910 ? 4 : 0)
//                          .offset(x: vm.size.height > 910  ? 4 : 0)
                        }
                        .allowsHitTesting(false)
                        
                        Image(.sep)
                          .resizableToFill()
                          .opacity(0.7)
                        
                        ScrollView(showsIndicators: false) {
                          VStack(spacing: 0) {
                            ForEach(1..<51) { i in
                              ZStack {
                                Image(vm.itemsMatrix[4][i-1] != 10 ? "t\(slot.currentTile)\(vm.itemsMatrix[4][i-1])" : "tb\(slot.currentBonusTile)")
                                  .resizableToFit()
                                  .frame(width: vm.size.width/6, height: slotHeight)
                                  .offset(x: 4)
                              }
                            }
                          }
                          .offset(y: vm.newPosition[4])
                          .offset(y: -slotHeight * 47 + 30)
                        }
                       .allowsHitTesting(false)
                      }
                    }
                    .mask {
                      Rectangle()
                        .fill(LinearGradient(stops: [.init(color: .white.opacity(0), location: 0.02), .init(color: .white.opacity(1), location: 0.1), .init(color: .white.opacity(1), location: 0.9), .init(color: .white.opacity(0), location: 0.95)], startPoint: .top, endPoint: .bottom))
                        .height(vm.h*0.4)
                            .scaleEffect(x: vm.size.height > 910 ?  1.07 : 1)
                            .scaleEffect(x: vm.size.height > 910  ?  1.07 : 1)
                            .scaleEffect(y: vm.size.height > 910  ?  0.98 : 1)
                    }
                }
                .overlay {
                  ZStack {
                    Lines()
                      .environmentObject(vm)
                      .blur(radius: 4)
                    
                    Lines()
                      .environmentObject(vm)
                      .blendMode(.hardLight)
                      .opacity(0.5)
                  }
                  .mask {
                    Rectangle()
                      .fill(.blue)
                      .frame(
                        width: showlines ? vm.size.width : 10, height: vm.tableSize.height)
                      .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
                      .animation(.easeInOut(duration: 1), value: showlines)
                  }
                  .offset(y: vm.h > 910 ? -18 : 0)
                  .offset(y: vm.isSE ? 16 : 0)
                }
        }
        .yOffset(-vm.h*0.1)
        .yOffsetIf(vm.isSEight, -16)
       
        if iteration >= 2 {
          VStack(spacing: 0) {
            Text("Last Win")
              .lootsFont(size: 12, style: .gilroyBold, color: .white)
            
            HStack {
                  Text("\(String(vm.lastWin))")
                    .lootsFont(size: 21, style: .killjoy, color: .white)
                    .overlayMask {
                      LinearGradient(stops: [.init(color: Color(hex: "FFF866"), location: 0.2), .init(color: Color(hex: "FFB515"), location: 0.52), .init(color: Color(hex: "FFEB05"), location: 0.9)], startPoint: .top, endPoint: .bottom)
                        .height(20)
                    }
            
              Image(.coins)
                .resizableToFit(height: 14)
            }
          }
          .yOffset(vm.h*0.15)
          .yOffsetIf(vm.isSEight, -36)
        }
      
        Image(.controlpanel)
          .resizableToFit()
          .overlay(.top) {
            Image(.balancebar)
              .resizableToFit()
              .overlay {
                VStack(spacing: -2) {
                  HStack {
                    ZStack {
                      Text("\(String(vm.balance))")
                        .lootsFont(size: 18, style: .killjoy, color: .white)
                        .customStroke(color: Color(hex: "610667"), width: 1)
                        .shadow(color: Color(hex: "610667"), radius: 1, x: 0, y: 1)
                      
                      Text("\(String(vm.balance))")
                        .lootsFont(size: 18, style: .killjoy, color: vm.isRotationWin ? .green : .red)
                        .customStroke(color: Color(hex: "610667"), width: 1)
                          .opacity(abs(sin(vm.balanceAnimCount * 3.14)))
                    }
                    
                    Image(.coins)
                      .resizableToFit(height: 14)
                  }
                  
                  Text("Balance")
                    .lootsFont(size: 12, style: .gilroyBold, color: .white)
                }
                .yOffset(2)
              }
              .yOffset(-30)
          }
          .overlay {
          
            VStack {
              if vm.freespins == 0 {
                HStack {
                  Image(.tfbetbg)
                    .resizableToFit(height: 42)
                    .overlay {
                      VStack(spacing: 0) {
                        HStack {
                          Text("\(vm.bet)")
                            .lootsFont(size: 18, style: .gilroyBlack, color: .white)
                          Image(.coins)
                            .resizableToFit(height: 10)
                        }
                        
                        Text("Bet Per Line")
                          .lootsFont(size: 12, style: .gilroyBold, color: .white)
                      }
                      .onTapGesture {
                        if enabledSpin {
                          showPicker.toggle()
                        }
                      }
                    }
                  
                  Image(.tfbetbg)
                    .resizableToFit(height: 42)
                    .overlay {
                      VStack(spacing: 0) {
                        HStack {
                          Text("\(vm.bet*vm.linesCount)")
                            .lootsFont(size: 18, style: .gilroyBlack, color: .white)
                          Image(.coins)
                            .resizableToFit(height: 10)
                        }
                        
                        Text("Total Bet")
                          .lootsFont(size: 12, style: .gilroyBold, color: .white)
                      }
                    }
                }
                
                Image(.linestfbg)
                  .resizableToFit(height: 42)
                  .overlay {
                    VStack(spacing: 0) {
                      Text("\(vm.linesCount)")
                        .lootsFont(size: 18, style: .gilroyBlack, color: .white)
                      Text("Lines")
                        .lootsFont(size: 12, style: .gilroyBold, color: .white)
                    }
                  }
                  .overlay(.leading) {
                    Button {
                      if vm.linesCount > 1 {
                        vm.linesCount -= 1
                      }
                    } label: {
                      Image(.minusbtn)
                        .resizableToFit(height: 36)
                    }
                    .saturation(vm.linesCount == 1 || !enabledSpin ? 0.2 : 1)
                    .disabled(vm.linesCount == 1)
                    .disabled(!enabledSpin)
                  }
                  .overlay(.trailing) {
                    Button {
                      if vm.linesCount < 9 {
                        vm.linesCount += 1
                      }
                    } label: {
                      Image(.plusbtn)
                        .resizableToFit(height: 36)
                    }
                    .saturation(vm.linesCount == 9 || !enabledSpin ? 0.2 : 1)
                    .disabled(vm.linesCount == 9)
                    .disabled(!enabledSpin)
                  }
              } else {
                LinearGradient(stops: [.init(color: Color(hex: "FFF866"), location: 0), .init(color: Color(hex: "FFB515"), location: 0.52), .init(color: Color(hex: "FFEB05"), location: 1)], startPoint: .top, endPoint: .bottom)
                  .frame(height: 40)
                  .mask {
                    Text("FREESPINS \(vm.freespins)")
                      .lootsFont(size: 30, style: .killjoy, color: .white)
                  }
              }
              Button {
                  if  vm.freespins > 0 {
                      vm.freespins -= 1
                  }
                      withAnimation(.none) {
                          vm.luckyLinesDraw = Array(repeating: false, count: 9)
                          vm.luckyRectDraw = Array(repeating: false, count: 9)
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
                    
                if vm.freespins == 0 {
                      vm.startBalanceAnimation()
                      vm.balance -= Int(vm.bet)*vm.linesCount
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
                              print(vm.currentMatrix[4])
                                              
                              vm.linesLogic()
                              
                              if vm.currentPayout != 0 {
                                  vm.isRotationWin = true
                                  vm.balanceAnimCount = 0
                                  vm.startBalanceAnimation()
                              }
                          }
                      
                          if vm.balance <= 10 {
                            vm.isBonusReady = true
                              vm.showBonus = true
                          }
                          print("*******")
                          showlines = true
                          vm.startAnimation()
                      }
                      
                      withAnimation(.spring(response: 1.8, dampingFraction: 0.8)) {
                          let newindex =  Int.random(in: 20...30)
                          vm.newPosition[0] = CGFloat( Int(slotHeight) * newindex)
                          vm.currentMatrix[0][0] = vm.itemsMatrix[0][49 - newindex]
                          vm.currentMatrix[0][1] = vm.itemsMatrix[0][49 - newindex - 1]
                          vm.currentMatrix[0][2] = vm.itemsMatrix[0][49 - newindex - 2]
                      }
                      
                      withAnimation(.spring(response: 1.7, dampingFraction: 0.7).delay(0.3)) {
                          let newindex =  Int.random(in: 20...30)
                          vm.newPosition[1] = CGFloat(Int(slotHeight)  * newindex)
                          vm.currentMatrix[1][0] = vm.itemsMatrix[1][49 - newindex]
                          vm.currentMatrix[1][1] = vm.itemsMatrix[1][49 - newindex - 1]
                          vm.currentMatrix[1][2] = vm.itemsMatrix[1][49 - newindex - 2]
                      }
                      
                      withAnimation(.spring(response: 1.7, dampingFraction: 0.8).delay(0.6)) {
                          let newindex =  Int.random(in: 20...30)
                          vm.newPosition[2] = CGFloat(Int(slotHeight)  * newindex)
                          vm.currentMatrix[2][0] = vm.itemsMatrix[2][49 - newindex]
                          vm.currentMatrix[2][1] = vm.itemsMatrix[2][49 - newindex - 1]
                          vm.currentMatrix[2][2] = vm.itemsMatrix[2][49 - newindex - 2]
                      }
                      
                      withAnimation(.spring(response: 1.5, dampingFraction: 0.8).delay(0.9)) {
                          let newindex =  Int.random(in: 20...30)
                          vm.newPosition[3] = CGFloat(Int(slotHeight)  * newindex)
                          vm.currentMatrix[3][0] = vm.itemsMatrix[3][49 - newindex]
                          vm.currentMatrix[3][1] = vm.itemsMatrix[3][49 - newindex - 1]
                          vm.currentMatrix[3][2] = vm.itemsMatrix[3][49 - newindex - 2]
                      }
                      
                      withAnimation(.spring(response: 1.5, dampingFraction: 0.8).delay(1.2)) {
                          let newindex =  Int.random(in: 20...30)
                        
                          vm.newPosition[4] = CGFloat(Int(slotHeight) * newindex)
                          vm.currentMatrix[4][0] = vm.itemsMatrix[4][49 - newindex]
                          vm.currentMatrix[4][1] = vm.itemsMatrix[4][49 - newindex - 1]
                          vm.currentMatrix[4][2] = vm.itemsMatrix[4][49 - newindex - 2]
                      }
              } label: {
                  Image(.spin)
                  .resizableToFit(height: 48)
                      .padding(.horizontal, 24)
                      .padding(.horizontal, vm.size.width < 380 ? 16 : 0)
              }
              .padding(.top, 16)
              .opacity(enabledSpin && !vm.isFreeSpin ? 1 : 0.5 )
              .disabled(!enabledSpin ||  ((Int(vm.bet*vm.linesCount) > vm.balance) && !vm.isFreeSpin))
              .opacity((Int(vm.bet*vm.linesCount) > vm.balance && !vm.isFreeSpin) ? 0.5 : 1)
             .animation(.easeInOut, value: vm.bet*vm.linesCount)
              .animation(.easeInOut, value: enabledSpin)

            }
          }
          .hPadding()
          .yOffset(vm.h*0.38)
          .yOffsetIf(vm.isSEight, -60)

        SlotInfo(slot: slot)
          .transparentIfNot(vm.showSlotInfo)
          .animation(.easeInOut, value: vm.showSlotInfo)
        
        dailyBonus
        
        ZStack {
          if vm.isBonusGame {
            BonusGame(slot: slot)
          }
        }
        .transparentIfNot(vm.isBonusGame)
        .animation(.default, value: vm.isBonusGame)
        
        ZStack {
          if vm.showBigWin {
            BigWin()
          }
        }
        .transparentIfNot(vm.showBigWin)
        .animation(.default, value: vm.showBigWin)
      }
      .sheet(isPresented: $showPicker) {
        ZStack {
          VStack(spacing: 0) {
            Picker("Select a Bet", selection: $vm.bet) {
              ForEach(Array(stride(from: 0, through: 1000, by: 10)), id: \.self) { number in
                Text("\(number)").tag(number)
                  .foregroundStyle(.white)
              }
            }
            .pickerStyle(.wheel)
            .frame(height: 180)
                
            okBtn
              .offset(y: vm.isSEight ? -24 : 0)
          }
        }
        .offset(y: 20)
        .vPadding()
        .presentationDetents([.fraction(vm.isSEight ? 0.4 : 0.33)])
        .background(BackgroundClearView(color: Color(hex: "808080").opacity(0.1)))
        .background(.ultraThinMaterial)
      }
      .navigationBarBackButtonHidden()
      .onAppear {
        vm.fillItems(isFirst: true)
        vm.fillCurrentNew()
        print(vm.currentMatrix)
      }
    }
  
  private var bg: some View {
    Image("bg\(slot.currentBg)")
      .backgroundFill()
      .scaleEffect(1.05)
  }
  
  private var okBtn: some View {
    Button {
      showPicker = false
    } label: {
      Image(.okbtn)
        .resizableToFit(height: 48)
        .overlay {
          Text("Ok")
            .lootsFont(size: 17, style: .killjoy, color: Color.white)
            .customStroke(color: Color(hex: "06670E"), width: 1)
            .yOffset(-8)
          
        }
    }
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
