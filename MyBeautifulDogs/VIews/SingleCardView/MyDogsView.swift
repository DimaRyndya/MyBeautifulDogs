import SwiftUI

struct MyDogsView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        List(0..<viewModel.userDogs.count, id: \.self) { selectedDog in
            HStack {
                Image(viewModel.userDogs[selectedDog].dogImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: Settings.mainScreenCardSize.width, height: Settings.mainScreenCardSize.height)
                VStack {
                    Text("")
                    Text(viewModel.userDogs[selectedDog].dogBreed )
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
