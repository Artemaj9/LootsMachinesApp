//
//  Slot.swift
//

import UIKit

//struct Slot: Hashable {
//    var currentTile: Int = 1
//    var currentBonusTile: Int = 1
//    var currentBg: Int = 1
//    var bonusVariant: Int = 1
//    var slotName: String = ""
//    var image: UIImage? = nil
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(currentTile)
//        hasher.combine(currentBonusTile)
//        hasher.combine(currentBg)
//        hasher.combine(bonusVariant)
//        hasher.combine(slotName)
//    }
//
//    static func == (lhs: Slot, rhs: Slot) -> Bool {
//        return lhs.currentTile == rhs.currentTile &&
//               lhs.currentBonusTile == rhs.currentBonusTile &&
//               lhs.currentBg == rhs.currentBg &&
//               lhs.bonusVariant == rhs.bonusVariant &&
//               lhs.slotName == rhs.slotName
//    }
//}

import UIKit

struct Slot: Codable, Hashable {
    var currentTile: Int = 1
    var currentBonusTile: Int = 1
    var currentBg: Int = 1
    var bonusVariant: Int = 1
    var slotName: String = ""
    var image: UIImage? = nil

    enum CodingKeys: String, CodingKey {
        case currentTile, currentBonusTile, currentBg, bonusVariant, slotName, image
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(currentTile, forKey: .currentTile)
        try container.encode(currentBonusTile, forKey: .currentBonusTile)
        try container.encode(currentBg, forKey: .currentBg)
        try container.encode(bonusVariant, forKey: .bonusVariant)
        try container.encode(slotName, forKey: .slotName)

        if let image = image {
            let imageData = image.jpegData(compressionQuality: 1.0)
            try container.encode(imageData, forKey: .image)
        } else {
            try container.encodeNil(forKey: .image)
        }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        currentTile = try container.decode(Int.self, forKey: .currentTile)
        currentBonusTile = try container.decode(Int.self, forKey: .currentBonusTile)
        currentBg = try container.decode(Int.self, forKey: .currentBg)
        bonusVariant = try container.decode(Int.self, forKey: .bonusVariant)
        slotName = try container.decode(String.self, forKey: .slotName)

        if let imageData = try container.decodeIfPresent(Data.self, forKey: .image) {
            image = UIImage(data: imageData)
        } else {
            image = nil
        }
    }

    init(currentTile: Int = 1, currentBonusTile: Int = 1, currentBg: Int = 1, bonusVariant: Int = 1, slotName: String = "", image: UIImage? = nil) {
        self.currentTile = currentTile
        self.currentBonusTile = currentBonusTile
        self.currentBg = currentBg
        self.bonusVariant = bonusVariant
        self.slotName = slotName
        self.image = image
    }
}


func getSlotsFileURL() -> URL {
    let fileManager = FileManager.default
    let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    return documentsURL.appendingPathComponent("slots.json")
}

func saveSlotsToFile(slots: [Slot]) {
    let fileURL = getSlotsFileURL()

    do {
        let jsonData = try JSONEncoder().encode(slots)
        try jsonData.write(to: fileURL)
        print("Slots saved successfully at \(fileURL)")
    } catch {
        print("Failed to save slots: \(error.localizedDescription)")
    }
}

func loadSlotsFromFile() -> [Slot]? {
    let fileURL = getSlotsFileURL()

    do {
        let data = try Data(contentsOf: fileURL)
        let slots = try JSONDecoder().decode([Slot].self, from: data)
        return slots
    } catch {
        print("Failed to load slots: \(error.localizedDescription)")
        return nil
    }
}

func deleteSlotsFile() {
    let fileURL = getSlotsFileURL()
    do {
        try FileManager.default.removeItem(at: fileURL)
        print("Slots file deleted successfully.")
    } catch {
        print("Failed to delete slots file: \(error.localizedDescription)")
    }
}
