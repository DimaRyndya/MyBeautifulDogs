import SwiftUI

struct DogDetailView: View {
    @EnvironmentObject var viewState: ViewState
    
    let dog = DogStore()

    var body: some View {

        VStack {
            Image(viewState.selectedDogCard?.dogImage ?? "")
                .resizable()
                .frame(width: Settings.dogDetailCardSize.width, height: Settings.dogDetailCardSize.height)
                .cornerRadius(20)
                .scaledToFill()
            Text(viewState.selectedDogCard?.dogBreed ?? "")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { withAnimation { viewState.showAllCards = true }} ) {
                    Image(systemName: "chevron.left")
                    Text("Back")
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
