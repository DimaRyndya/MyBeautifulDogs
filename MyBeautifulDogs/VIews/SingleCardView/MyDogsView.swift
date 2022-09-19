import SwiftUI

struct MyDogsView: View {
    @EnvironmentObject var dogStore: DogStore

    var body: some View {
        List(0..<dogStore.userDogs.count, id: \.self) { selectedDog in
            HStack {
                Image(dogStore.userDogs[selectedDog].dogImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: Settings.mainScreenCardSize.width, height: Settings.mainScreenCardSize.height)
                Text(dogStore.userDogs[selectedDog].dogBreed )
            }
        }
    }
}

struct MyDogsView_Previews: PreviewProvider {
    static var previews: some View {
        MyDogsView()
            .environmentObject(DogStore())
    }
}
