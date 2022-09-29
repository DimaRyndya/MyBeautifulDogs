import SwiftUI

struct DogModalView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        List(0..<viewModel.getAllDogBreeds().count, id: \.self) { dog in
            HStack {
                SingleCardView(index: dog)
                VStack {
                    Text(viewModel.getSelectedDogBreed(dog: dog))
                    Button("Choose Dog") {
                        alertTF(title: "Adding dog name", message: "Please add dog name", primaryTitle: "Add", secondaryTitle: "Cancel") { text in
                            viewModel.addSavedDog(
                                dogName: text,
                                dogCard: viewModel.getSelectedDogBreedName(dog: dog))
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
