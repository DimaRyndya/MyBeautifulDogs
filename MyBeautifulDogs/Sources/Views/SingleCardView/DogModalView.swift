import SwiftUI

struct DogModalView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        List(0..<viewModel.getAllDogBreeds().count, id: \.self) { dog in
            HStack {
                SingleCardView(dogImage: viewModel.getSelectedDogInfo(dog: dog).dogImage)
                VStack {
                    Text(viewModel.getSelectedDogInfo(dog: dog).dogBreed)
                    Button("Choose Dog") {
                        alertTF(title: "Adding dog name", message: "Please add dog name", primaryTitle: "Add", secondaryTitle: "Cancel") { text in
                            viewModel.addSavedDog(
                                dogName: text,
                                dogCard: viewModel.getSelectedDogInfo(dog: dog))
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
            .environmentObject(ViewModel())
    }
}
