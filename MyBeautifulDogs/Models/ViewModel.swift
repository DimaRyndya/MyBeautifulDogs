import SwiftUI

class ViewModel: ObservableObject {

    private var dogStore = DogStore()


    func getSelectedDogBreedName(dog: Int) -> BreedName {
        dogStore.allDogBreeds[dog]
    }
    func getAllDogBreedsImage(index: Int) -> String {
        dogStore.allDogBreeds[index].dogImage
    }

    func getAllDogBreeds() -> [BreedName] {
        dogStore.allDogBreeds
    }

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
