import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        List(0..<viewModel.getAllDogBreeds().count, id: \.self) { index in
            HStack {
                SingleCardView(index: index)
                Text(viewModel.getAllDogBreeds()[index].dogBreed)
            }
            .onTapGesture {
                viewState.showAllCards.toggle()
                viewState.selectedDogCard = viewModel.getSelectedDogBreedName(dog: index)
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
