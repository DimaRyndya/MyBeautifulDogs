import SwiftUI

struct DogModalView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var viewState: ViewState
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                Spacer()
                HStack {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding(.trailing, 15)
                }
            }
            List(0..<viewModel.dogStore.allDodBreeds.count, id: \.self) { dog in
                HStack {
                    SingleCardView(index: dog)
                    VStack {
                        Text(viewModel.dogStore.allDodBreeds[dog].dogBreed)
                        Button("Choose Dog") {
                            alertTF(title: "Adding dog name", message: "Please add dog name", primaryTitle: "Add", secondaryTitle: "Cancel") { text in
                                viewModel.addSavedDog(dogName: text, dogCard: viewModel.dogStore.allDodBreeds[dog])
                            } secondaryAction: {
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.blue)
                        .padding()
                    }

                }
            }
        }
    }
}

struct DogModalView_Previews: PreviewProvider {
    static var previews: some View {
        DogModalView()
            .environmentObject(ViewState())
            .environmentObject(ViewModel())
    }
}
