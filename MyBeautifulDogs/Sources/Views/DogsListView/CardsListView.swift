import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var allDogs: AllDogsModel
    
    var body: some View {
        List(0..<allDogs.getAllDogBreeds().count, id: \.self) { dog in
            HStack {
                SingleCardView(dogImage: allDogs.getSelectedDogInfo(dog: dog).dogImage)
                Text(allDogs.getAllDogBreeds()[dog].dogBreed)
            }
            .onTapGesture {
                viewState.showAllCards.toggle()
                viewState.selectedDogCard = allDogs.getSelectedDogInfo(dog: dog)
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
            .environmentObject(ViewState())
            .environmentObject(AllDogsModel())
    }
}
