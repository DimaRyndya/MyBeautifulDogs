import SwiftUI

class ViewModel: ObservableObject {
    let dogStore = DogStore()
    
    @Published var userDogs: [BreedName] = []


    func addDog(dogCard: BreedName?) {
        if let dogCard = dogCard {
            userDogs.append(dogCard)
        }
    }
    
}
