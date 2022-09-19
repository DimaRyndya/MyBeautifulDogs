import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        List(0..<viewModel.dogStore.allDodBreeds.count, id: \.self) { dog in
            HStack {
                SingleCardView(index: dog)
                Text(viewModel.dogStore.allDodBreeds[dog].dogBreed)
                
            }
            .onTapGesture {
                viewState.showAllCards.toggle()
                viewState.selectedDogCard = viewModel.dogStore.allDodBreeds[dog]
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
