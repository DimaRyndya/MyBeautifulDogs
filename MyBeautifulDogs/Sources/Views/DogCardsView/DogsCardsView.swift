import SwiftUI

enum Dimensions {
    static let adaptive: CGFloat = 120
    static let spacing: CGFloat = 10
    static let cornerRadius: CGFloat = 20
}

struct DogsCardsView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var viewModel: ViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: Dimensions.adaptive), spacing: Dimensions.spacing),
        GridItem(.adaptive(minimum: Dimensions.adaptive), spacing: Dimensions.spacing)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(0..<viewModel.getAllDogBreeds().count) { dog in
                    SingleCardView(dogImage: viewModel.getSelectedDogInfo(dog: dog).dogImage)
                        .onTapGesture {
                            viewState.showAllCards.toggle()
                            viewState.selectedDogCard = viewModel.getSelectedDogInfo(dog: dog)
                        }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        DogsCardsView()
            .environmentObject(ViewState())
            .environmentObject(ViewModel())
    }
}
