import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        List(0..<viewModel.getAllDogBreeds().count, id: \.self) { dog in
            HStack {
                SingleCardView(index: dog)
                Text(viewModel.getSavedDogBreed(for: dog))
                
            }
            .onTapGesture {
                viewState.showAllCards.toggle()
                viewState.selectedDogCard = viewModel.getSelectedDogBreedName(dog: dog)
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
            .environmentObject(ViewState())
            .environmentObject(ViewModel())
    }
}
