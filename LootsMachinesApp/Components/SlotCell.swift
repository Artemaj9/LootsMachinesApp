//
//  SlotCell.swift
//

import SwiftUI

struct SlotCell: View {
  let slot: Slot
  @EnvironmentObject var nm: NavigationStateManager
  @EnvironmentObject var vm: GameViewModel
  
  var body: some View {
    ZStack {
      Image(.slotcell)
        .resizableToFit(height: 200)
        .overlay(.top) {
          RoundedRectangle(cornerRadius: 24)
            .fill(.white)
            .width(130)
            .height(80)
            .overlay {
              Image(uiImage: slot.image ?? UIImage(resource: .bg2))
                .resizableToFill()
                .allowsHitTesting(false)
                .mask {
                  RoundedRectangle(cornerRadius: 24)
                    .fill(.white)
                    .height(80)
                    .width(130)
                }
                .clipped()
            }
            .hPadding(12)
            .height(80)
            .yOffset(20)
        }
        .overlay {
          Text(slot.slotName)
            .lootsFont(size: 18, style: .killjoy, color: .white)
            .multilineTextAlignment(.center)
            .lineLimit(3)
            .minimumScaleFactor(0.8)
            .hPadding(20)
            .yOffset(36)
        }
        .overlay(.bottom) {
          Button {
            nm.path.append(.game(slot))
          } label: {
            Image(.playbtn)
              .resizableToFit(height: 44)
          }
          .yOffset(20)
        }
        .overlay(alignment: .topTrailing) {
          Button {
            vm.slotToDel = slot
            vm.showDelete = true
          } label: {
            Image(.delbtn)
              .resizableToFit(height: 32)
          }
        }
    }
  }
}

#Preview {
  SlotCell(slot: Slot(currentTile: 1, currentBonusTile: 2, currentBg: 3, bonusVariant: 3, slotName: "Koooodjkasjdasd;as;dalklkl;ffg", image: UIImage(resource: .bg4)))
    .nm
    .vm
}
