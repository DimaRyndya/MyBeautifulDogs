import SwiftUI

private enum Dimensions {
    static let adaptive: CGFloat = 120
    static let spacing: CGFloat = 10
}

struct DogsCardsView: View {
    @EnvironmentObject var viewState: ViewState
    
    var allDogs: AllDogsModel
    
    let columns = [
        GridItem(.adaptive(minimum: Dimensions.adaptive), spacing: Dimensions.spacing),
        GridItem(.adaptive(minimum: Dimensions.adaptive), spacing: Dimensions.spacing)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(0..<allDogs.getAllDogBreeds().count) { dog in
                    SingleCardView(dogImage: allDogs.getSelectedDogInfo(dog: dog).dogImage)
                        .onTapGesture {
                            viewState.showAllCards.toggle()
                            viewState.selectedDogCard = allDogs.getSelectedDogInfo(dog: dog)
                        }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        DogsCardsView(allDogs: AllDogsModel())
            .environmentObject(ViewState())
    }
}
