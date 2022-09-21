import SwiftUI

class ViewModel: ObservableObject {

    let dogStore = DogStore()
    
    @Published var userDogs: [SavedDog] = []
    
    init() {}

    func addSavedDog(dogName: String, dogCard: BreedName?) {
        if let dogCard = dogCard {
            var savedDog = SavedDog()
            savedDog.dogName = dogName
            savedDog.breedName = dogCard
            userDogs.append(savedDog)
        }
    }

    func getSavedDogName(for selectedDog: Int) -> String {
        var dogName = ""
        dogName = userDogs[selectedDog].dogName
        return dogName
    }

    func getUserDogsCount(for selectedCard: BreedName?) -> Int {
        var counter = 0
        let filteredUserDogs = userDogs.filter { $0.breedName?.dogBreed == selectedCard?.dogBreed }
        counter = filteredUserDogs.count
        return counter
    }


    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
       // userDogs += try container.decode([String].self, forKey: .dogName)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        let dogName = userDogs.compactMap { $0.dogName }
        try container.encode(dogName, forKey: .dogName)
        let dogBreed = userDogs.compactMap { $0.breedName?.dogBreed }
        try container.encode(dogBreed, forKey: .dogBreed)
        let dogImage = userDogs.compactMap { $0.breedName?.dogImage }
        try container.encode(dogImage, forKey: .dogImage)
    }

    enum CodingKeys: CodingKey {
        case dogName, dogBreed, dogImage
    }

}
