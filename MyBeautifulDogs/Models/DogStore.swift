import SwiftUI


class DogStore: Codable {

    var id = UUID()

    var allDogBreeds: [BreedName] = [
        BreedName.bostonTerrier,
        BreedName.stBernardPuppy,
        BreedName.caneCorso,
        BreedName.chowChow,
        BreedName.border,
        BreedName.pembrokeWelshCorgi,
        BreedName.beagle,
        BreedName.yorkshireTerrier,
        BreedName.pomeranian,
        BreedName.frenchBulldog
    ]

    private(set) var userDogs: [SavedDog] = []

    init() {}

    func save() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            let filename = "\(id).rwcard"
            if let url = FileManager.documentURL?
                .appendingPathComponent(filename) {
                try data.write(to: url)
            }
        } catch {
            print(error.localizedDescription)
        }
    }


    func addSavedDog(dogName: String, dogCard: BreedName?){
        var savedDog = SavedDog()
        if let dogCard = dogCard {
            savedDog.dogName = dogName
            savedDog.breedName = dogCard
        }
        userDogs.append(savedDog)
        save()
    }


    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let savedDog = try container.decode(SavedDog.self, forKey: .savedDogs)
        userDogs.append(savedDog)
        let id = try container.decode(String.self, forKey: .id)
        self.id = UUID(uuidString: id) ?? UUID()
//        userDogs += try container.decode([SavedDog].self, forKey: .dogName)
//        userDogs += try container.decode([SavedDog].self, forKey: .breedName)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(userDogs, forKey: .savedDogs)
//        let dogName = userDogs.compactMap { $0.dogName as String }
//        try container.encode(dogName, forKey: .dogName)
//        let breedName = userDogs.compactMap{ $0.breedName as BreedName? }
//        try container.encode(breedName, forKey: .breedName)
    }

    enum CodingKeys: CodingKey {
        case savedDogs, id
//        case id, dogName, breedName
    }

}



