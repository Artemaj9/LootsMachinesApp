//
//  CreateSlot.swift
//

import SwiftUI
import Combine

struct CreateSlot: View {
  @EnvironmentObject var nm: NavigationStateManager
  @EnvironmentObject var vm: GameViewModel
  @State private var startAnimation = false
  @State private var showPhotoPicker = false
  @State private var sourceType: UIImagePickerController.SourceType = .camera
  @State private var isPickerPresented = false
  @State private var showActionSheet = false
  @FocusState private var isFocused: Bool
  @State private var keyboardHeight: CGFloat = 0
  
    var body: some View {
      ZStack {
        Image(.bg)
          .backgroundFill()
          .onTapGesture {
            UIApplication.shared.endEditing()
          }
        
        ScrollView {
          VStack(spacing: 30) {
            Color.clear.height(50)
            
            ZStack {
              RoundedRectangle(cornerRadius: 32)
                .fill(LinearGradient(colors: [Color(hex: "#340ACE"), Color(hex: "#1A0568")], startPoint: .top, endPoint: .bottom))
                .height(182)
              
              LinearGradient(gradient: .init(colors: [Color(hex: "37CAFF"), Color(hex: "FF37F5")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 0))
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

                        if ["500", "3000"].contains(calcPrice(tile: vm.currentTile)) {
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
                        
                        if ["500", "3000"].contains(calcPrice(tile: vm.currentBonusTile)) {
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
              
              LinearGradient(gradient: .init(colors: [Color(hex: "37CAFF"), Color(hex: "FF37F5")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 0))
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
                        if ["500", "3000"].contains(calcPrice(tile: vm.currentBg)) {
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
            
            HStack {
              Image(.firstvariant)
                .resizableToFit()
                .overlay(.bottom) {
                  Button {
                    withAnimation {
                      vm.bonusVariant = 1
                    }
                  } label: {
                    Image(vm.bonusVariant == 1 ? .readybtn : .setbtn)
                      .resizableToFit(height: 50)
                  }
                  .yOffset(20)
                }
              
              Image(.secondvariant)
                .resizableToFit()
                .overlay(.bottom) {
                  Button {
                    withAnimation {
                      vm.bonusVariant = 2
                    }
                  } label: {
                    Image(vm.bonusVariant == 2 ? .readybtn : .setbtn)
                      .resizableToFit(height: 50)
                  }
                  .yOffset(20)
                }
            }
            .hPadding()
            .padding(.top)
            
            HStack {
              Button {
                nm.path = []
              } label: {
                Image(.cbackbtn)
                  .resizableToFit(height: 52)
              }
              
              Button {
                vm.balance -= vm.tileCost + vm.bonusTileCost + vm.bgCost
                let newSlot = Slot(
                  currentTile: vm.currentTile,
                  currentBonusTile: vm.currentBonusTile,
                  currentBg: vm.currentBg,
                  bonusVariant: vm.bonusVariant,
                  slotName: vm.slotName,
                  image: vm.previewImage
                )
                vm.slots.insert(newSlot, at: 0)
                saveSlotsToFile(slots: vm.slots)
                vm.showCreatedGame = true
                nm.path.append(.game(newSlot))
                vm.justCreated = true
              } label: {
                Image(.continuebtn)
                  .resizableToFit(height: 54)
              }
              .saturation(vm.isSlotReady ? 1 : 0.2)
              .disabled(!vm.isSlotReady)
            }
          
            .vPadding()
            Color.clear.height(300)
          }
        }
        .scrollMask(0.1, 0.9)
        .scrollIndicators(.hidden)
        .yOffset(vm.h*0.25)
             
        Image(.fotocover)
          .resizableToFit()
          .overlay {
            if let image = vm.previewImage {
              Image(uiImage: image)
                .resizableToFill()
                .allowsHitTesting(false)
                .mask {
                  Image(.fotocover)
                    .resizableToFit()
                }
            }
          }
          .opacity(keyboardHeight > 0 ? 0.001 : 1)
          .overlay {
            Button {
              showActionSheet = true
            } label: {
              Image(.uploadbtn)
                .resizableToFit(height: 120)
                .opacity(vm.previewImage != nil ? 0.001 : 1)
            }
            .scaleEffect(vm.isSEight ? 0.8 : 1)
            .yOffset(20)
            
          }
          .overlay(.bottom) {
            Image(.slotnametfbg)
              .resizableToFit()
              .overlay {
                ZStack {
                  LinearGradient(stops: [
                    .init(color: Color(hex: "#FFF866"), location: 0),
                    .init(color: Color(hex: "#FFB515"), location: 0.5),
                    .init(color: Color(hex: "#FFB515"), location: 1)], startPoint: .bottom, endPoint: .top)
                  .height(40)
                  .mask {
                    Text("SLOT NAME")
                      .lootsFont(size: 21, style: .killjoy, color: .white)
                  }
                  .transparentIf(!vm.slotName.isEmpty || isFocused)
                  .animation(.easeInOut, value: vm.slotName.isEmpty || !isFocused)
                  .allowsHitTesting(false)
                  
                  ZStack {
                      // Gradient text overlay
                      LinearGradient(
                          colors: [
                              Color(hex: "#FFF866"),
                              Color(hex: "#FFB515"),
                              Color(hex: "#FFB515")
                          ],
                          startPoint: .bottom,
                          endPoint: .top
                      )
                      .mask(
                          Text(vm.slotName.isEmpty ? "" : vm.slotName)
                              .lootsFont(size: 21, style: .killjoy, color: .white)
                              .multilineTextAlignment(.center)
                              .lineLimit(1)
                              .width(vm.w*0.7)
                              .minimumScaleFactor(0.5)
                      )
                    
                      TextField("", text: $vm.slotName)
                          .lootsFont(size: 21, style: .killjoy, color: .white)
                          .autocorrectionDisabled()
                          .multilineTextAlignment(.center)
                          .lineLimit(1)
                          .opacity(0.1)
                          .focused($isFocused)
                          .width(vm.w*0.7)
                          .height(30)
                  }
                }
              }
              .yOffset(vm.h*0.03)
              .yOffset(keyboardHeight > 0 ? 20 : 0)
              .animation(.easeIn, value: keyboardHeight)
            
          }
          .yOffset(-vm.h*0.4)
          .yOffsetIf(vm.isSEight, 30)
      }
      .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
      .navigationBarBackButtonHidden()
      .onAppear {
        startAnimation = true
      }
      .sheet(isPresented: $showPhotoPicker) {
        ImagePicker(image: $vm.originalImage, isShown: self.$showPhotoPicker, sourceType: self.sourceType)
          .background( content: {
            Color.black.opacity(0.8)
              .ignoresSafeArea()
          })
      }
      .sheet(isPresented: $isPickerPresented) {
        PhotoPicker(selectedImage: $vm.originalImage)
      }
      .sheet(isPresented: $showActionSheet) {
        ZStack {
          VStack(spacing: 20) {
            Button {
              showPhotoPicker = true
              showActionSheet = false
            } label: {
              Text("Camera")
                .lootsFont(size: 18, style: .gilroyBold, color: .white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(hex: "009B15"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Button {
              isPickerPresented = true
              showActionSheet = false
            } label: {
              Text("Photo Library")
                .lootsFont(size: 18, style: .gilroyBold, color: .white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(hex: "009B15"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Button {
              showActionSheet = false
            } label: {
              Text("Cancel")
                .lootsFont(size: 20, style: .gilroyBold, color: .white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(hex: "D3484B"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
          }
        }
        .offset(y: 20)
        .offset(y: vm.isSEight ? -24 : 0)
        .vPadding()
        .presentationDetents([.fraction(vm.isSEight ? 0.4 : 1/3)])
        .padding()
        .background(BackgroundClearView(color: Color(hex: "808080").opacity(0.1)))
        .background(.ultraThinMaterial)
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
