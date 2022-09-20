import SwiftUI

class ViewModel: ObservableObject {
    let dogStore = DogStore()
    
    @Published var userDogs: [SavedDog] = []
    


    func addSavedDog(dogName: String, dogCard: BreedName?) {
        if let dogCard = dogCard {
            let savedDog = SavedDog()
            savedDog.dogName = dogName
            savedDog.breedName = dogCard
            userDogs.append(savedDog)
        }
    }

    func getSavedDogName(for selectedDog: Int, in userDogs: [SavedDog]) -> String {
        var dogName = ""
        dogName = userDogs[selectedDog].dogName
        return dogName
    }
}
