//
//  Slot.swift
//

import UIKit

struct Slot: Hashable {
    var currentTile: Int = 1
    var currentBonusTile: Int = 1
    var currentBg: Int = 1
    var bonusVariant: Int = 1
    var slotName: String = ""
    var image: UIImage? = nil

    func hash(into hasher: inout Hasher) {
        hasher.combine(currentTile)
        hasher.combine(currentBonusTile)
        hasher.combine(currentBg)
        hasher.combine(bonusVariant)
        hasher.combine(slotName)
    }

    static func == (lhs: Slot, rhs: Slot) -> Bool {
        return lhs.currentTile == rhs.currentTile &&
               lhs.currentBonusTile == rhs.currentBonusTile &&
               lhs.currentBg == rhs.currentBg &&
               lhs.bonusVariant == rhs.bonusVariant &&
               lhs.slotName == rhs.slotName
    }
}
