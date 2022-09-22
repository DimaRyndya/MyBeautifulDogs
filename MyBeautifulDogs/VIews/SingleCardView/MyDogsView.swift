import SwiftUI

struct MyDogsView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var viewState: ViewState
    @State private var isPresented = false

    var body: some View {
        ZStack {
            List(0..<viewModel.getSavedDogs().count, id: \.self) { selectedDog in
                HStack {
                    Image(viewModel.getSavedDogImage(for: selectedDog))
                        .resizable()
                        .scaledToFit()
                        .frame(width: Settings.mainScreenCardSize.width, height: Settings.mainScreenCardSize.height)
                    VStack {
                        Text(viewModel.getSavedDogName(for: selectedDog))
                        Text(viewModel.getSavedDogBreed(for: selectedDog))
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
