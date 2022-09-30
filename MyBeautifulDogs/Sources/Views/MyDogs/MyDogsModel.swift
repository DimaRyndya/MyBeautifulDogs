import SwiftUI

class MyDogsModel: ObservableObject {
    private var dogStore = DogStore()

    func getSavedDogs() -> [SavedDog] {
        dogStore.userDogs
    }

    func getUserDogsCount(for selectedCard: BreedName?) -> Int {
        var counter = 0
        let filteredUserDogs = dogStore.userDogs.filter { $0.breedName?.dogBreed == selectedCard?.dogBreed }
        counter = filteredUserDogs.count
        return counter
    }

    func addSavedDog(dogName: String, dogCard: BreedName?) {
        do {
            try dogStore.addSavedDog(dogName: dogName, dogCard: dogCard) }
        catch DogError.dogAlreadyExists {
            print("Dog Already exists")
            return
        } catch {
            print("Error")
        }
        objectWillChange.send()
    }


    func getSavedDogInfo(for selectedDog: Int) -> SavedDog {
        let dogName = dogStore.userDogs[selectedDog]
        return dogName
    }
    
    //MARK: Removing saved dog from savedDogs arrey

    func removeSavedDog(for selectedDog: Int) {
        dogStore.removeSavedDog(for: selectedDog)
        objectWillChange.send()
    }
}




