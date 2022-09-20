import SwiftUI

struct MyDogsView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
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
    }
}

struct MyDogsView_Previews: PreviewProvider {
    static var previews: some View {
        MyDogsView()
            .environmentObject(ViewModel())
    }
}
