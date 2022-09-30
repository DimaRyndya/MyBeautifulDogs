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


    func getSavedDogName(for selectedDog: Int) -> String {
        let dogName = dogStore.userDogs[selectedDog].dogName
        return dogName
    }

    func getSavedDogImage(for selectedDog: Int) -> String {
        let dogImage = dogStore.userDogs[selectedDog].breedName?.dogImage ?? ""
        return dogImage
    }

    func getSavedDogBreed(for selectedDog: Int) -> String {
        let dogBreed = dogStore.userDogs[selectedDog].breedName?.dogBreed ?? ""
        return dogBreed
    }
}
