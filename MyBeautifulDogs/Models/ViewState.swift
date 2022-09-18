import SwiftUI

class ViewState: ObservableObject {
    @Published var showAllCards = true
    @Published var selectedDogCard: BreedName?

    convenience init(dog: BreedName) {
        self.init()
        showAllCards = true
        selectedDogCard = dog
    }

}
