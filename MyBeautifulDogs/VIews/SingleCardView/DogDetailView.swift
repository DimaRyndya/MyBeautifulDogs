import SwiftUI

struct DogDetailView: View {
    @EnvironmentObject var viewState: ViewState
    
    let dog = DogStore()

    var body: some View {
        ZStack {
            Button(action: { viewState.showAllCards.toggle() }) {
                Text("Back")
            }
            VStack {
                Image(viewState.selectedDogCard?.dogImage ?? "")
                Text(viewState.selectedDogCard?.dogBreed ?? "")
            }
        }
    }
}

struct DogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogDetailView()
            .environmentObject(ViewState())
    }
}
