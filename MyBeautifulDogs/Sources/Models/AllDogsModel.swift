import SwiftUI

class AllDogsModel {
    private var dogStore = DogStore()

    //MARK: Getting dogs info such as breed or image in allDogsBreed
    
    func getSelectedDogInfo(dog: Int) -> BreedName {
        let dogInfo = dogStore.allDogBreeds[dog]
        return dogInfo
    }

    //MARK: Getting array of allDogsBreed
    
    func getAllDogBreeds() -> [BreedName] {
        dogStore.allDogBreeds
    }
}
