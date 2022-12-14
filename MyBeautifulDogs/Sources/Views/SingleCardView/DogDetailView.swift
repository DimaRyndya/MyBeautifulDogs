import SwiftUI

private enum Dimensions {
    static let cornerRadius: CGFloat = 20
    static let dogDetailCardSize = CGSize(width: 350, height: 400)
    static let mainScreenCardSize = CGSize(width: 180, height: 150)
}

private enum Configuraions {
    static let backButton = "Back"
    static let addDogButton = "Add Dog"
}

struct DogDetailView: View {
    @EnvironmentObject var myDogs: MyDogsModel
    @EnvironmentObject var viewState: ViewState

    var body: some View {
        VStack {
            Image(viewState.selectedDogCard?.dogImage ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: Dimensions.dogDetailCardSize.width, height: Dimensions.dogDetailCardSize.height)
                .cornerRadius(Dimensions.cornerRadius)
            Text(viewState.selectedDogCard?.dogBreed ?? "")

            if myDogs.getUserDogsCount(for: viewState.selectedDogCard) == 0 {
                Text("")
            } else {
                Text("\(myDogs.getUserDogsCount(for: viewState.selectedDogCard))")
            }
            
            Button(Configuraions.addDogButton) {
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
                        Text(Configuraions.backButton)
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
            .environmentObject(MyDogsModel())
    }
}
