import SwiftUI

class AllDogsModel: ObservableObject {
    
    private var dogStore = DogStore()
    
    
    func getSelectedDogInfo(dog: Int) -> BreedName {
        let dogInfo = dogStore.allDogBreeds[dog]
        return dogInfo
    }
    
    func getAllDogBreeds() -> [BreedName] {
        dogStore.allDogBreeds
    }
}
