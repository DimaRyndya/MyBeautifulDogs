import SwiftUI

struct DogDetailView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var dogStore: DogStore


    var body: some View {
        VStack {
            Image(viewState.selectedDogCard?.dogImage ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: Settings.dogDetailCardSize.width, height: Settings.dogDetailCardSize.height)
                .cornerRadius(20)
            Text(viewState.selectedDogCard?.dogBreed ?? "")
           // Text("\(dogStore.userDogs[viewState.selectedDogCard].count)")
            Button("Add Dog") {
                let currentDog = viewState.selectedDogCard
                dogStore.addDog(dogCard: currentDog)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation { viewState.showAllCards = true }
                    } ) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
            }
        }
    }
}

struct DogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogDetailView()
            .environmentObject(ViewState())
            .environmentObject(DogStore())
    }
}
