import SwiftUI


class DogStore: Identifiable, Codable {

    let id = UUID()


    let allDogBreeds: [BreedName] = [
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

    init() { }


    func addSavedDog(dogName: String, dogCard: BreedName?){
        var savedDog = SavedDog()
        if let dogCard = dogCard {
            savedDog.dogName = dogName
            savedDog.breedName = dogCard
        }
        userDogs.append(savedDog)
    }


    required init(from decoder: Decoder) throws {
        <#code#>
    }
    func encode(to encoder: Encoder) throws {
        <#code#>
    }

    func save(dog: String) {
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



}



