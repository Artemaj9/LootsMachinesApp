////
////  FishTF.swift
////
//
//import SwiftUI
//import Combine
//
//struct FishTF: View {
//    @EnvironmentObject var vm: GameViewModel
//    @State var textColor = Color.white
//    let placeholderText: String = ""
//  @State private var isEditing: Bool = false
//    
//
//    var widthCoef = 0.79
//    var height: Double = 65
//    
//    var body: some View {
//        ZStack {
//             Image(.tfbg)
//                .resizableToFit()
//            
//            TextField(placeholderText, text: Binding(
//              get: {
//                  if isEditing {
//                    return vm.weight
//                  } else {
//                    return vm.weight.isEmpty ? "" : "\(vm.weight) lbs"
//                  }
//              },
//              set: { newValue in
//                  if isEditing {
//                    vm.weight = newValue.filter { $0.isNumber }
//                  }
//              }
//          ), onEditingChanged: { editing in
//              self.isEditing = editing
//            if editing && vm.isCalculated {
//              let temp = vm.fishType
//              vm.isCalculated = false
//              vm.calculatedYield = nil
//            }
//          })
//                .foregroundColor(textColor)
//                .multilineTextAlignment(.leading)
//                .lineLimit(1)
//                .font(.custom(.robotoReg, size: 14))
//                .padding(.horizontal)
//                .cornerRadius(12)
//                .keyboardType(.numberPad)
//                .onReceive(Just(vm.weight)) { newValue in
//                    let filtered = newValue.filter { "0123456789".contains($0) }
//                    if filtered != newValue {
//                        vm.weight = filtered
//                    }
//                }
//                .overlay(alignment: .leading) {
//                    Text("Enter the weight of the fish (lbs)")
//                        .freshFishingFont(size: 12, style: .robotoReg, color: .white.opacity(0.3))
//                        .padding(.leading)
//                        .opacity(vm.weight.isEmpty ? 1 : 0)
//                        .animation(.easeOut, value: vm.weight.isEmpty)
//                        .allowsHitTesting(false)
//                }
//                .overlay(alignment: .trailing) {
//                    Image(.pen)
//                        .resizableToFit()
//                        .frame(width: 25, height: 25)
//                        .padding(.trailing)
//                        .allowsHitTesting(false)
//                }
//        }
//        .frame(width: vm.size.width*widthCoef, height: height)
//    }
//}
//
