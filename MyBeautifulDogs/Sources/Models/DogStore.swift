import SwiftUI

class DogStore: Codable {
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
    
    private let documentURL = "dogsStore.rwcard"
    
    init() {
        if let savedStore = tryLoadStoreFromDisc() {
            userDogs = savedStore.userDogs
        }
    }
    
    func save() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            let filename = documentURL
            if let url = FileManager.documentURL?
                .appendingPathComponent(filename) {
                try data.write(to: url)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func tryLoadStoreFromDisc() -> DogStore? {
        let decoder = JSONDecoder()
        if let url = FileManager.documentURL?.appendingPathComponent(documentURL) {
            do {
                let data = try Data(contentsOf: url)
                let savedStore = try decoder.decode(DogStore.self, from: data)
                return savedStore
            } catch {
                print(error)
            }
        }
        
        return nil
    }
    
    func isDogExists(dog: SavedDog) -> Bool {
        let filteredUserDogs = userDogs.filter { $0.dogName == dog.dogName && $0.breedName?.dogBreed == dog.breedName?.dogBreed}
        return !filteredUserDogs.isEmpty
    }
    
    func addSavedDog(dogName: String, dogCard: BreedName?) throws {
        var savedDog = SavedDog()
        if let dogCard = dogCard {
            savedDog.dogName = dogName
            savedDog.breedName = dogCard
        }
        if !isDogExists(dog: savedDog) {
            userDogs.append(savedDog)
            save()
        }
        else {
            throw DogError.dogAlreadyExists
        }
    }

    //MARK: Encoding and Decoding DogSctore date

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userDogs = try container.decode([SavedDog].self, forKey: .savedDogs)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userDogs, forKey: .savedDogs)
    }

    enum CodingKeys: CodingKey {
        case savedDogs
    }

}

