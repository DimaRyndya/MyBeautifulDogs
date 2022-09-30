import SwiftUI

struct DogModalView: View {
    @EnvironmentObject var allDogs: AllDogsModel
    @EnvironmentObject var myDogs: MyDogsModel
    
    var body: some View {
        List(0..<allDogs.getAllDogBreeds().count, id: \.self) { dog in
            HStack {
                SingleCardView(dogImage: allDogs.getSelectedDogInfo(dog: dog).dogImage)
                VStack {
                    Text(allDogs.getSelectedDogInfo(dog: dog).dogBreed)
                    Button("Choose Dog") {
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
        .navigationBarTitle("Dogs List")
    }
}
struct DogModalView_Previews: PreviewProvider {
    static var previews: some View {
        DogModalView()
            .environmentObject(AllDogsModel())
            .environmentObject(MyDogsModel())
    }
}
