//
//  Lines.swift
//

import SwiftUI

struct Lines: View {
    @EnvironmentObject var vm: GameViewModel
    var body: some View {
        ZStack {
            Image(.l1)
                .resizableToFit()
                .padding()
                .offset(y: -vm.tableSize.height*0.27)
                .opacity(vm.luckyLinesDraw[0] ? 1 : 0)
                .mask {
                Rectangle()
                .fill(.blue)
                    .frame(
                        width: vm.luckyRectDraw[0] ? vm.size.width : 10, height: vm.tableSize.height)
                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[0])
                }
            Image(.l2)
                .resizableToFit()
                .padding()
                .offset(y: 0)
                .opacity(vm.luckyLinesDraw[1] ? 1 : 0)
                .mask {
                Rectangle()
                .fill(.blue)
                    .frame(
                        width: vm.luckyRectDraw[1] ? vm.size.width : 10, height: vm.tableSize.height)
                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[0])
                }
            Image(.l3)
                .resizableToFit()
                .padding()
                .offset(y: 0.3 * vm.tableSize.height)
                .opacity(vm.luckyLinesDraw[2] ? 1 : 0)
                .mask {
                Rectangle()
                .fill(.blue)
                    .frame(
                        width: vm.luckyRectDraw[2] ? vm.size.width : 10, height: vm.tableSize.height)
                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[2])
                }
            Image(.l4)
                .resizableToFit()
                .offset(y: 0.01 * vm.tableSize.height)
                .scaleEffect(y: 1.2)
                .padding(.horizontal)
                .opacity(vm.luckyLinesDraw[3] ? 1 : 0)
                .mask {
                Rectangle()
                .fill(.blue)
                    .frame(
                        width: vm.luckyRectDraw[3] ? vm.size.width : 10, height: vm.tableSize.height)
                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[3])
                }
            Image(.l5)
                .resizableToFit()
                .scaleEffect(y: 1.2)
                .offset(y: 0.01 * vm.tableSize.height)
                .padding(.horizontal)
                .opacity(vm.luckyLinesDraw[4] ? 1 : 0)
                .mask {
                Rectangle()
                .fill(.blue)
                    .frame(
                        width: vm.luckyRectDraw[4] ? vm.size.width : 10, height: vm.tableSize.height)
                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[4])
                }
            
            Image(.l6)
                .resizableToFit()
                .padding(.horizontal)
              //  .scaleEffect(x: 0.9, y: 0.87, anchor: .center)
                .offset(y: 0.17 * vm.tableSize.height)
                .opacity(vm.luckyLinesDraw[5] ? 1 : 0)
                .mask {
                Rectangle()
                .fill(.blue)
                    .frame(
                        width: vm.luckyRectDraw[5] ? vm.size.width : 10, height: vm.tableSize.height)
                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[5])
                }
            
            Image(.l7)
                .resizableToFit()
                .padding(.horizontal)
                .scaleEffect(y: 1.2)
                .offset(y: -0.1 * vm.tableSize.height)
                .opacity(vm.luckyLinesDraw[6] ? 1 : 0)
                .mask {
                Rectangle()
                .fill(.blue)
                    .frame(
                        width: vm.luckyRectDraw[6] ? vm.size.width : 10, height: vm.tableSize.height)
                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[6])
                }
            Image(.l8)
                .resizableToFit()
                .offset(y: -0.03 * vm.tableSize.height)
                .padding(.horizontal)
                .scaleEffect(y: 1.35)
                .yOffset(0.05*vm.tableSize.height)
                .opacity(vm.luckyLinesDraw[7] ? 1 : 0)
                .mask {
                Rectangle()
                .fill(.blue)
                    .frame(
                        width: vm.luckyRectDraw[7] ? vm.size.width : 10, height: vm.tableSize.height)
                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[7])
                }
            
            Image(.l9)
                .resizableToFit()
                .offset(y: -0.03 * vm.tableSize.height)
                .scaleEffect(y: 1.35)
                .yOffset(0.05*vm.tableSize.height)

                .opacity(vm.luckyLinesDraw[8] ? 1 : 0)
                .mask {
                Rectangle()
                .fill(.blue)
                    .frame(
                        width: vm.luckyRectDraw[8] ? vm.size.width : 10, height: vm.tableSize.height)
                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[8])
                }
        }
        .onAppear {
          vm.luckyLinesDraw[0] = true
          vm.luckyRectDraw[0] = true
        }
    }
}

#Preview {
    Lines()
    .vm
}
