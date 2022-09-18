import SwiftUI

struct DogDetailView: View {
    @EnvironmentObject var viewState: ViewState
    
    let dog = DogStore()

    var body: some View {

        VStack {
            Image(viewState.selectedDogCard?.dogImage ?? "")
            Text(viewState.selectedDogCard?.dogBreed ?? "")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { withAnimation { viewState.showAllCards = true } }) {
                    Text("Done")
                }
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
