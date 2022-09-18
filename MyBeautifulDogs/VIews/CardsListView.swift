import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState

    let dogStore = DogStore()

    var body: some View {
        List(0..<dogStore.dogs.count, id: \.self) { dog in
            HStack {
                SingleCardView(index: dog)
                Text(dogStore.dogs[dog].dogBreed)
                
            }
            .onTapGesture {
                viewState.showAllCards.toggle()
                viewState.selectedDogCard = dogStore.dogs[dog]
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
            .environmentObject(ViewState())
    }
}
