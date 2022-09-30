import SwiftUI

class MyDogsModel: ObservableObject {
    private var dogStore = DogStore()

    //MARK: Getting saving dogs arrey

    func getSavedDogs() -> [SavedDog] {
        dogStore.userDogs
    }

    //MARK: Getting userDogs counter

    func getUserDogsCount(for selectedCard: BreedName?) -> Int {
        var counter = 0
        let filteredUserDogs = dogStore.userDogs.filter { $0.breedName?.dogBreed == selectedCard?.dogBreed }
        counter = filteredUserDogs.count
        return counter
    }

    //MARK: Saving user dog to userDogs array

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

    //MARK: Gitting saved dog info such as name, breed or image

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




