////
////  Lines.swift
////
//
//import SwiftUI
//
//struct Lines: View {
//    @EnvironmentObject var vm: GameViewModel
//    var body: some View {
//        ZStack {
//            Image(.l1)
//                .resizableToFit()
//                .padding()
//                .offset(y: -vm.tableSize.height*0.11)
//                .opacity(vm.luckyLinesDraw[0] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[0] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[0])
//                }
//            Image(.l2)
//                .resizableToFit()
//                .padding()
//                .offset(y: vm.tableSize.height/8)
//                .opacity(vm.luckyLinesDraw[1] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[1] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[0])
//                }
//            Image(.l3)
//                .resizableToFit()
//                .padding()
//                .offset(y: -0.32 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[2] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[2] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[2])
//                }
//            Image(.l4)
//                .resizableToFit()
//                .padding()
//                .offset(y: 0.34 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[3] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[3] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[3])
//                }
//            Image(.l5)
//                .resizableToFit()
//                .padding(.horizontal)
//                .scaleEffect(x: 0.9, y: 0.87, anchor: .center)
//                .offset(y: 0.1 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[4] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[4] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[4])
//                }
//            
//            Image(.l6)
//                .resizableToFit()
//                .padding(.horizontal)
//                .scaleEffect(x: 0.9, y: 0.87, anchor: .center)
//                .offset(y: -0.1 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[5] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[5] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[5])
//                }
//            
//            Image(.l7)
//                .resizableToFit()
//                .padding(.horizontal)
//                .offset(y: 0.06 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[6] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[6] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[6])
//                }
//            Image(.l8)
//                .resizableToFit()
//                .padding(.horizontal)
//                .offset(y: -0.06 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[7] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[7] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[7])
//                }
//            
//            Image(.l9)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 1, anchor: .center)
//                .offset(y: 0.18 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[8] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[8] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[8])
//                }
//            
//            
//            Image(.l10)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 1, anchor: .center)
//                .offset(y: -0.18 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[9] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[9] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[9])
//                }
//            
//            
//            Image(.l11)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 0.9, anchor: .center)
//                .offset(y: -0.04 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[10] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[10] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[10])
//                }
//            
//            Image(.l12)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 0.9, anchor: .center)
//                .offset(y: 0.04 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[11] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[11] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[11])
//                }
//            
//            Image(.l13)
//                .resizableToFit()
//                .scaleEffect(x: 0.78, y: 0.8, anchor: .center)
//                .offset(y: 0.11 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[12] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[12] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[12])
//                }
//            
//            Image(.l14)
//                .resizableToFit()
//                .scaleEffect(x: 0.78, y: 0.8, anchor: .center)
//                .offset(y: -0.11 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[13] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[13] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[13])
//                }
//            
//            
//            
//            Image(.l15)
//                .resizableToFit()
//                .scaleEffect(x: 0.82, y: 0.85, anchor: .center)
//                .offset(y: -0.22 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[14] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[14] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[14])
//                }
//            Image(.l16)
//                .resizableToFit()
//                .scaleEffect(x: 0.78, y: 0.81, anchor: .center)
//                .offset(y: 0.25 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[15] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[15] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[15])
//                }
//            
//            Image(.l17)
//                .resizableToFit()
//                .scaleEffect(x: 0.75, y: 0.75, anchor: .center)
//                .offset(y: -0.11 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[16] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[16] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[16])
//                }
//            Image(.l18)
//                .resizableToFit()
//                .scaleEffect(x: 0.75, y: 0.75, anchor: .center)
//                .offset(y: 0.11 * vm.tableSize.height)
//               .opacity(vm.luckyLinesDraw[17] ? 1 : 0)
//               .mask {
//               Rectangle()
//               .fill(.blue)
//                   .frame(
//                       width: vm.luckyRectDraw[17] ? vm.size.width : 10, height: vm.tableSize.height)
//                   .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                   .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[17])
//               }
//            Image(.l19)
//                .resizableToFit()
//                .scaleEffect(x: 0.88, y: 0.85, anchor: .center)
//                .offset(y: -0.25 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[18] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[18] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[18])
//                }
//            Image(.l20)
//                .resizableToFit()
//                .scaleEffect(x: 0.87, y: 0.85, anchor: .center)
//                .offset(y: 0.25 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[19] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[19] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[19])
//                }
//            Image(.l21)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 0.73, anchor: .center)
//                .offset(y: 0.12 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[20] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[20] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[20])
//                }
//            Image(.l22)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 0.73, anchor: .center)
//                .offset(y: -0.08 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[21] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[21] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[21])
//                }
//            
//            Image(.l23)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 0.85, anchor: .center)
//                .offset(y: -0.02 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[22] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[22] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[22])
//                }
//            
//            Image(.l24)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 0.8, anchor: .center)
//                .offset(y: 0.02 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[23] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[23] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[23])
//                }
//
//            Image(.l25)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 0.95, anchor: .center)
//                .offset(y: -0.1 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[25] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[25] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[25])
//                }
//
//            Image(.l26)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 0.95, anchor: .center)
//                .offset(y: 0.1 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[24] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[24] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[24])
//                }
//            
//            Image(.l27)
//                .resizableToFit()
//                .scaleEffect(x: 0.85, y: 0.85, anchor: .center)
//                .offset(y: -0.22 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[26] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[26] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[26])
//                }
//            Image(.l28)
//                .resizableToFit()
//                .scaleEffect(x: 0.85, y: 0.85, anchor: .center)
//                .offset(y: 0.2 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[27] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[27] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[27])
//                }
//            Image(.l29)
//                .resizableToFit()
//                .scaleEffect(x: 0.85, y: 0.85, anchor: .center)
//                .offset(y: 0.25 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[28] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[28] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[28])
//                }
//            Image(.l30)
//                .resizableToFit()
//                .scaleEffect(x: 0.85, y: 0.85, anchor: .center)
//                .offset(y: -0.23 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[29] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[29] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[29])
//                }
//            Image(.l31)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 0.8, anchor: .center)
//                .offset(y: -0.08 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[30] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[30] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[30])
//                }
//            Image(.l32)
//                .resizableToFit()
//                .scaleEffect(x: 0.9, y: 0.8, anchor: .center)
//                .offset(y: 0.08 * vm.tableSize.height)   .opacity(vm.luckyLinesDraw[31] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[31] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[31])
//                }
//            Image(.l33)
//                .resizableToFit()
//                .scaleEffect(x: 0.85, y: 0.8, anchor: .center)
//                .offset(y: 0.09 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[32] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[32] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[32])
//                }
//            Image(.l34)
//                .resizableToFit()
//                .scaleEffect(x: 0.85, y: 0.8, anchor: .center)
//                .offset(y: -0.09 * vm.tableSize.height)
//                .opacity(vm.luckyLinesDraw[33] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[33] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[33])
//                }
//            Image(.l35)
//                .resizableToFit()
//                .scaleEffect(x: 0.85, y: 0.8, anchor: .center)
//            
//                .opacity(vm.luckyLinesDraw[34] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[34] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[34])
//                }
//            Image(.l36)
//                .resizableToFit()
//                .scaleEffect(x: 0.85, y: 0.8, anchor: .center)   .opacity(vm.luckyLinesDraw[35] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[35] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[35])
//                }
//            Image(.l37)
//                .resizableToFit()
//                .scaleEffect(x: 0.8, y: 0.8, anchor: .center)
//                .opacity(vm.luckyLinesDraw[36] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[36] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[36])
//                }
//            
//            Image(.l38)
//                .resizableToFit()
//                .scaleEffect(x: 0.8, y: 0.8, anchor: .center)
//                .opacity(vm.luckyLinesDraw[37] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[37] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[37])
//                }
//            
//            Image(.l39)
//                .resizableToFit()
//                .scaleEffect(x: 0.8, y: 0.8, anchor: .center)
//                .opacity(vm.luckyLinesDraw[38] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[38] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[38])
//                }
//            
//            Image(.l40)
//                .resizableToFit()
//                .scaleEffect(x: 0.8, y: 0.8, anchor: .center)
//                .opacity(vm.luckyLinesDraw[39] ? 1 : 0)
//                .mask {
//                Rectangle()
//                .fill(.blue)
//                    .frame(
//                        width: vm.luckyRectDraw[39] ? vm.size.width : 10, height: vm.tableSize.height)
//                    .frame(width: vm.size.width, height: vm.tableSize.height, alignment: .leading)
//                    .animation(.easeInOut(duration: 1), value: vm.luckyRectDraw[39])
//                }
//        }
//    }
//}
//
//#Preview {
//    Lines()
//        .environmentObject(GameViewModel())
//}
