//
//  CreateSlot.swift
//

import SwiftUI

struct CreateSlot: View {
  @EnvironmentObject var nm: NavigationStateManager
  @EnvironmentObject var vm: GameViewModel
  @State private var startAnimation = false
  
    var body: some View {
      ZStack {
        Image(.bg)
          .backgroundFill()
        
        ScrollView {
          VStack(spacing: 30) {
            ZStack {
              RoundedRectangle(cornerRadius: 32)
                .fill(LinearGradient(colors: [Color(hex: "#340ACE"), Color(hex: "#1A0568")], startPoint: .top, endPoint: .bottom))
                .height(182)
              
              LinearGradient(gradient: .init(colors: [Color(hex: "37CAFF"), Color(hex: "FF37F5")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1 , y: 0))
                .mask {
                  RoundedRectangle(cornerRadius: 32)
                    .stroke(lineWidth: 2)
                    .height(178)
                }
                .animation(.linear(duration: 5).repeatForever(autoreverses: true), value: startAnimation)
            }
            .overlay(.top) {
              Image("tp\(vm.currentTile)")
                .resizableToFit()
                .hPadding(8)
                .yOffset(8)
            }
            .overlay {
              VStack(spacing: 4) {
                Text(Txt.tilesType[vm.currentTile - 1])
                  .lootsFont(size: 21, style: .killjoy, color: .white)
                
                Text("TILES TYPE")
                  .lootsFont(size: 12, style: .gilroyBold, color: .white)
              }
              .yOffset(40)
            }
            .hPadding()
            .overlay(.bottom) {
              HStack {
                Button {
                  if vm.currentTile > 1 {
                    vm.currentTile -= 1
                  } else {
                    vm.currentTile = 5
                  }
                } label: {
                  Image(.prevbtn)
                    .resizableToFit(height: 40)
                }
                
                Button {
                  
                } label: {
                  Image(.pricebg)
                    .resizableToFit(height: 48)
                    .overlay {
                      HStack(spacing: -4) {
                        Text(calcPrice(tile: vm.currentTile))
                          .lootsFont(size: 21, style: .killjoy, color: .white)
                          .minimumScaleFactor(0.4)
                          .hPadding(12)
                          .lineLimit(1)
                          .customStroke(color: Color(hex: "06670E"), width: 1)
                        if ["500","3000"].contains(calcPrice(tile: vm.currentTile)) {
                          Image(.coins)
                            .resizableToFit(height: 20)
                        }
                      }
                      .yOffset(-4)
                      
                    }
                }
                .disabled(calcPrice(tile: vm.currentTile) == "NOT ENOUGH COINS")
                .saturation(calcPrice(tile: vm.currentTile) == "NOT ENOUGH COINS" ? 0.2 : 1)
                
                Button {
                  if vm.currentTile < 5 {
                    vm.currentTile += 1
                  } else {
                    vm.currentTile = 1
                  }
                } label: {
                  Image(.nextbtn)
                    .resizableToFit(height: 40)
                }
              }
              .yOffset(20)
              
              
              
            }
            
            ZStack {
              RoundedRectangle(cornerRadius: 32)
                .fill(LinearGradient(colors: [Color(hex: "#340ACE"), Color(hex: "#1A0568")], startPoint: .top, endPoint: .bottom))
                .height(182)
              
              LinearGradient(gradient: .init(colors: [Color(hex: "37CAFF"), Color(hex: "FF37F5")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1 , y: 0))
                .mask {
                  RoundedRectangle(cornerRadius: 32)
                    .stroke(lineWidth: 2)
                    .height(178)
                }
                .animation(.linear(duration: 5).repeatForever(autoreverses: true), value: startAnimation)
            }
            .overlay(.top) {
              Image("bp\(vm.currentBonusTile)")
                .resizableToFit()
                .hPadding(8)
                .yOffset(8)
            }
            .overlay {
              VStack(spacing: 4) {
                Text(Txt.bonusTiles[vm.currentBonusTile - 1])
                  .lootsFont(size: 21, style: .killjoy, color: .white)
                
                Text("BONUS TILE")
                  .lootsFont(size: 12, style: .gilroyBold, color: .white)
              }
              .yOffset(40)
            }
            .hPadding()
            .overlay(.bottom) {
              HStack {
                Button {
                  if vm.currentBonusTile > 1 {
                    vm.currentBonusTile -= 1
                  } else {
                    vm.currentBonusTile = 5
                  }
                } label: {
                  Image(.prevbtn)
                    .resizableToFit(height: 40)
                }
                
                Button {
                  
                } label: {
                  Image(.pricebg)
                    .resizableToFit(height: 48)
                    .overlay {
                      HStack(spacing: -4) {
                        Text(calcPrice(tile: vm.currentBonusTile))
                          .lootsFont(size: 21, style: .killjoy, color: .white)
                          .minimumScaleFactor(0.4)
                          .hPadding(12)
                          .lineLimit(1)
                          .customStroke(color: Color(hex: "06670E"), width: 1)
                        if ["500","3000"].contains(calcPrice(tile: vm.currentBonusTile)) {
                          Image(.coins)
                            .resizableToFit(height: 20)
                        }
                      }
                      .yOffset(-4)
                      
                    }
                }
                .disabled(calcPrice(tile: vm.currentBonusTile) == "NOT ENOUGH COINS")
                .saturation(calcPrice(tile: vm.currentBonusTile) == "NOT ENOUGH COINS" ? 0.2 : 1)
                
                Button {
                  if vm.currentBonusTile < 5 {
                    vm.currentBonusTile += 1
                  } else {
                    vm.currentBonusTile = 1
                  }
                } label: {
                  Image(.nextbtn)
                    .resizableToFit(height: 40)
                }
              }
              .yOffset(20)
            }
            
            
            ZStack {
              RoundedRectangle(cornerRadius: 32)
                .fill(LinearGradient(colors: [Color(hex: "#340ACE"), Color(hex: "#1A0568")], startPoint: .top, endPoint: .bottom))
                .height(182)
              
              LinearGradient(gradient: .init(colors: [Color(hex: "37CAFF"), Color(hex: "FF37F5")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1 , y: 0))
                .mask {
                  RoundedRectangle(cornerRadius: 32)
                    .stroke(lineWidth: 2)
                    .height(178)
                }
                .animation(.linear(duration: 5).repeatForever(autoreverses: true), value: startAnimation)
            }
            .overlay(.top) {
              Image("bgp\(vm.currentBg)")
                .resizableToFit()
                .hPadding(8)
                .yOffset(8)
            }
            .overlay {
              VStack(spacing: 4) {
                Text(Txt.tilesType[vm.currentBg - 1])
                  .lootsFont(size: 21, style: .killjoy, color: .white)
                
                Text("SLOT BACKGROUND")
                  .lootsFont(size: 12, style: .gilroyBold, color: .white)
              }
              .yOffset(40)
            }
            .hPadding()
            .overlay(.bottom) {
              HStack {
                Button {
                  if vm.currentBg > 1 {
                    vm.currentBg -= 1
                  } else {
                    vm.currentBg = 5
                  }
                } label: {
                  Image(.prevbtn)
                    .resizableToFit(height: 40)
                }
                
                Button {
                  
                } label: {
                  Image(.pricebg)
                    .resizableToFit(height: 48)
                    .overlay {
                      HStack(spacing: -4) {
                        Text(calcPrice(tile: vm.currentBg))
                          .lootsFont(size: 21, style: .killjoy, color: .white)
                          .minimumScaleFactor(0.4)
                          .hPadding(12)
                          .lineLimit(1)
                          .customStroke(color: Color(hex: "06670E"), width: 1)
                        if ["500","3000"].contains(calcPrice(tile: vm.currentBg)) {
                          Image(.coins)
                            .resizableToFit(height: 20)
                        }
                      }
                      .yOffset(-4)
                      
                    }
                }
                .disabled(calcPrice(tile: vm.currentBg) == "NOT ENOUGH COINS")
                .saturation(calcPrice(tile: vm.currentBg) == "NOT ENOUGH COINS" ? 0.2 : 1)
                
                Button {
                  if vm.currentBg < 5 {
                    vm.currentBg += 1
                  } else {
                    vm.currentBg = 1
                  }
                } label: {
                  Image(.nextbtn)
                    .resizableToFit(height: 40)
                }
              }
              .yOffset(20)
            }
          }
        }
        .yOffset(vm.h*0.2)
      }
      .onAppear {
        startAnimation = true
      }
    }
  
  private func calcPrice(tile: Int) -> String {
    if tile == 4 {
      if vm.balance < 500 {
        return "NOT ENOUGH COINS"
      } else {
        return "500"
      }
    }
    
    if tile == 5 {
      if vm.balance < 3000 {
        return "NOT ENOUGH COINS"
      } else {
        return "3000"
      }
    }
    
    return "FREE"
  }
}

#Preview {
    CreateSlot()
    .nm
    .vm
}
