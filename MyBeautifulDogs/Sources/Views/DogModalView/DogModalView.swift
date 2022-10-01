import SwiftUI

private enum Configuraions {
    static let choseDog = "Dogs Cards"
    static let dogsList = "Dogs List"
}

struct DogModalView: View {
    @EnvironmentObject private var myDogs: MyDogsModel
    
    var allDogs: AllDogsModel
    
    var body: some View {
        List(0..<allDogs.getAllDogBreeds().count, id: \.self) { dog in
            HStack {
                SingleCardView(dogImage: allDogs.getSelectedDogInfo(dog: dog).dogImage)
                VStack {
                    Text(allDogs.getSelectedDogInfo(dog: dog).dogBreed)
                    Button(Configuraions.choseDog) {
                        alertTF(title: "Adding dog name", message: "Please add dog name", primaryTitle: "Add", secondaryTitle: "Cancel") { text in
                            myDogs.addSavedDog(
                                dogName: text,
                                dogCard: allDogs.getSelectedDogInfo(dog: dog))
                        } secondaryAction: {
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.blue)
                    .padding()
                }
            }
        }
        .navigationBarTitle(Configuraions.dogsList)
    }
}
struct DogModalView_Previews: PreviewProvider {
    static var previews: some View {
        DogModalView(allDogs: AllDogsModel())
            .environmentObject(MyDogsModel())
    }
}
