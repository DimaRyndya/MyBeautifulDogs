import SwiftUI

class ViewState: ObservableObject {
    @Published var showAllCards = true {
        didSet {
            if showAllCards {
                selectedDogCard = nil
            }
        }
    }
    @Published var selectedDogCard: BreedName?

    convenience init(dog: BreedName) {
        self.init()
        showAllCards = false
        selectedDogCard = dog
    }

}
