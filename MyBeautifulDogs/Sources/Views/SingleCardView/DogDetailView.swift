import SwiftUI

struct DogDetailView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var myDogs: MyDogsModel
    
    var body: some View {
        VStack {
            Image(viewState.selectedDogCard?.dogImage ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: Settings.dogDetailCardSize.width, height: Settings.dogDetailCardSize.height)
                .cornerRadius(Dimensions.cornerRadius)
            Text(viewState.selectedDogCard?.dogBreed ?? "")

            if myDogs.getUserDogsCount(for: viewState.selectedDogCard) == 0 {
                Text("")
            } else {
                Text("\(myDogs.getUserDogsCount(for: viewState.selectedDogCard))")
            }
            
            Button("Add Dog") {
                alertTF(title: "Adding dog name", message: "Please add dog name", primaryTitle: "Add", secondaryTitle: "Cancel") { text in
                    myDogs.addSavedDog(
                        dogName: text,
                        dogCard: viewState.selectedDogCard)
                } secondaryAction: {
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation { viewState.showAllCards = true }
                    }) {
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
            .environmentObject(AllDogsModel())
    }
}