import SwiftUI

struct MyDogsView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var isPresented = false

    var body: some View {
        ZStack {
            List(0..<viewModel.getSavedDogs().count, id: \.self) { selectedDog in
                HStack {
                    Image(viewModel.getSavedDogImage(for: selectedDog))
                        .resizable()
                        .cornerRadius(20)
                        .scaledToFit()
                        .frame(width: Settings.mainScreenCardSize.width, height: Settings.mainScreenCardSize.height)

                    VStack {
                        Text(viewModel.getSavedDogName(for: selectedDog))
                        Text(viewModel.getSavedDogBreed(for: selectedDog))
                    }
                }
            }
            NavigationView {
                NavigationLink(destination: DogModalView()) {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()

                }
            }
        }
    }
}


struct MyDogsView_Previews: PreviewProvider {
    static var previews: some View {
        MyDogsView()
            .environmentObject(ViewModel())
    }
}
