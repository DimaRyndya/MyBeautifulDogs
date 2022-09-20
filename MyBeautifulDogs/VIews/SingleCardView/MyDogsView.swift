import SwiftUI

struct MyDogsView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var viewState: ViewState
    @State private var isPresented = false

    var body: some View {
        ZStack {
            List(0..<viewModel.userDogs.count, id: \.self) { selectedDog in
                HStack {
                    Image(viewModel.userDogs[selectedDog].breedName?.dogImage ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: Settings.mainScreenCardSize.width, height: Settings.mainScreenCardSize.height)
                    VStack {
                        Text(viewModel.getSavedDogName(for: selectedDog))
                        Text(viewModel.userDogs[selectedDog].breedName?.dogBreed ?? "" )
                    }
                }
            }

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {isPresented.toggle() }) {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                        .padding()
                        .fullScreenCover(isPresented: $isPresented, content: DogModalView.init)
                    }
                }
            }
        }
    }
}

struct MyDogsView_Previews: PreviewProvider {
    static var previews: some View {
        MyDogsView()
            .environmentObject(ViewModel())
            .environmentObject(ViewState())
    }
}
