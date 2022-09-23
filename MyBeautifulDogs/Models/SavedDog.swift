import SwiftUI

struct SavedDog {
//    var id = UUID()
    var dogName = ""
    var breedName: BreedName?

}

extension SavedDog: Codable {

    enum CodingKeys: CodingKey {
        case dogName, breedName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dogName = try container.decode(String.self, forKey: .dogName)
        breedName = try container.decode(BreedName.self, forKey: .breedName)
//        let id = try container.decode(String.self, forKey: .id)
//        self.id = UUID(uuidString: id) ?? UUID()
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dogName, forKey: .dogName)
        try container.encode(breedName, forKey: .breedName)
//        try container.encode(id, forKey: .id)
    }
}
