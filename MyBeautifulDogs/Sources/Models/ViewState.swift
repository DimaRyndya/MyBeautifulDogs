import SwiftUI

class ViewState: ObservableObject {
    @Published var showAllCards = true
    @Published var selectedDogCard: BreedName?
    @Published var selectedTab = 0
}
