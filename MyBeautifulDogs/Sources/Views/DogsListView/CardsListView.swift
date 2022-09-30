import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        List(0..<viewModel.getAllDogBreeds().count, id: \.self) { dog in
            HStack {
                SingleCardView(dogImage: viewModel.getSelectedDogInfo(dog: dog).dogImage)
                Text(viewModel.getAllDogBreeds()[dog].dogBreed)
            }
            .onTapGesture {
                viewState.showAllCards.toggle()
                viewState.selectedDogCard = viewModel.getSelectedDogInfo(dog: dog)
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
