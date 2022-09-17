import SwiftUI

class ViewState: ObservableObject {
    @Published var showAllCards = true
    @Published var selectedDogCard = DogStore()

    convenience init(dog: DogStore) {
        self.init()
        showAllCards = false
       // selectedDogCard.dogs = dog.dogs.hashValue
    }

}
