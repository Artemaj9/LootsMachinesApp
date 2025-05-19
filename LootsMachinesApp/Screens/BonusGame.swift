//
//  BonusGame.swift
//

import SwiftUI

struct BonusGame: View {
  @EnvironmentObject var vm: GameViewModel
  let slot: Slot
  
    var body: some View {
      ZStack {
        BackBlurView(radius: 5)
          .ignoresSafeArea()
        Color(hex: "1C0035").opacity(0.8)
          .ignoresSafeArea()
        Image(.bonusgametitle)
          .resizableToFit(height: 104)
          .yOffset(-vm.h*0.37)
        
        Text("CHOOSE ONE BONUS TILE")
          .lootsFont(size: 18, style: .gilroyBlack, color: .white)
          .yOffset(-vm.h*0.25)
        
        ZStack {
          RadialGradient(colors: [vm.bonusWin[0]  > 0 ? .white : .red, vm.bonusWin[0] > 0 ? .white.opacity(0) : .red.opacity(0)], center: .center, startRadius: 0, endRadius: 80)
            .blendMode(.luminosity)
            .transparentIf(vm.bonusGameState == 1)
            .animation(.easeInOut, value: vm.bonusGameState)
          Image("tb\(slot.currentBonusTile)")
            .resizableToFit(height: 184)
          
          if vm.bonusGameState == 2 && vm.bonusUserSelection == 1 {
            LinearGradient(stops: [.init(color: Color(hex: "FFF866"), location: 0.2), .init(color: Color(hex: "FFB515"), location: 0.52), .init(color: Color(hex: "FFEB05"), location: 0.9)], startPoint: .top, endPoint: .bottom)
              .height(70)
              .mask {
                Text(vm.bonusWin[0]  > 0 ? "WIN!" : "LOOSE!")
                  .lootsFont(size: 56, style: .killjoy, color: .white)
                  .rotationEffect(Angle(degrees: 15))
              }
           }
        }
        .onTapGesture {
          if vm.bonusGameState == 1 {
            vm.bonusGameState = 2
            vm.bonusUserSelection = 1
            vm.handleBonusSelection()
          }
        }
          .offset(-vm.w*0.25, -vm.h*0.1)
        
        ZStack {
          RadialGradient(colors: [vm.bonusWin[1]  > 0 ? .white : .red, vm.bonusWin[1] > 0 ? .white.opacity(0) : .red.opacity(0)], center: .center, startRadius: 0, endRadius: 80)
            .blendMode(.luminosity)
            .transparentIf(vm.bonusGameState == 1)
            .animation(.easeInOut, value: vm.bonusGameState)
            
          Image("tb\(slot.currentBonusTile)")
            .resizableToFit(height: 184)
          
          if vm.bonusGameState == 1 && vm.bonusUserSelection == 2 {
            LinearGradient(stops: [.init(color: Color(hex: "FFF866"), location: 0.2), .init(color: Color(hex: "FFB515"), location: 0.52), .init(color: Color(hex: "FFEB05"), location: 0.9)], startPoint: .top, endPoint: .bottom)
              .height(70)
              .mask {
                Text(vm.bonusWin[1]  > 0 ? "WIN!" : "LOOSE!")
                  .lootsFont(size: 56, style: .killjoy, color: .white)
                  .rotationEffect(Angle(degrees: 15))
              }
           }
        }
        .onTapGesture {
          if vm.bonusGameState == 1 {
            vm.bonusGameState = 2
            vm.bonusUserSelection = 2
            vm.handleBonusSelection()
          }
        }
          .offset(vm.w*0.25, -vm.h*0.1)
       
        ZStack {
          RadialGradient(colors: [vm.bonusWin[2]  > 0 ? .white : .red, vm.bonusWin[2] > 0 ? .white.opacity(0) : .red.opacity(0)], center: .center, startRadius: 0, endRadius: 80)
            .blendMode(.luminosity)
            .transparentIf(vm.bonusGameState == 1)
            .animation(.easeInOut, value: vm.bonusGameState)
          
          Image("tb\(slot.currentBonusTile)")
            .resizableToFit(height: 184)
          
          if vm.bonusGameState == 2 && vm.bonusUserSelection == 3 {
            LinearGradient(stops: [.init(color: Color(hex: "FFF866"), location: 0.2), .init(color: Color(hex: "FFB515"), location: 0.52), .init(color: Color(hex: "FFEB05"), location: 0.9)], startPoint: .top, endPoint: .bottom)
              .height(70)
              .mask {
                Text(vm.bonusWin[2]  > 0 ? "WIN!" : "LOOSE!")
                  .lootsFont(size: 56, style: .killjoy, color: .white)
                  .rotationEffect(Angle(degrees: 15))
              }
           }
        }
        .onTapGesture {
          if vm.bonusGameState == 1 {
            vm.bonusGameState = 2
            vm.bonusUserSelection = 3
            vm.handleBonusSelection()
          }
        }
        .yOffset(vm.h*0.1)

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
              LinearGradient(stops: [.init(color: Color(hex: "FFF866"), location: 0), .init(color: Color(hex: "FFB515"), location: 0.52), .init(color: Color(hex: "FFEB05"), location: 1)], startPoint: .top, endPoint: .bottom)
                .frame(height: 40)
                .mask {
                  Text("FREESPINS \(vm.freespins == 0 ? "???" : "\(vm.freespins)")")
                    .lootsFont(size: 30, style: .killjoy, color: .white)
                }
                .yOffset(-20)
          }
        .hPadding()
        .yOffset(vm.h*0.43)
        }
      .onAppear {
          vm.generateBonusWin(for: slot.bonusVariant)
      }
    }
}

#Preview {
    BonusGame(
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
}
