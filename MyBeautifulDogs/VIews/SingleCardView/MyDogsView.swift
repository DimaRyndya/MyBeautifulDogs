import SwiftUI

struct MyDogsView: View {
    var userDog = UserDogs()

    var body: some View {
        Text("hello")
//        List(0..<userDog.userDogs.count, id: \.self) { userDog in
//            HStack {
//                SingleCardView(index: userDog)
//                Image(userDog.userDogs[userDog]?.dogImage ?? "")
//                Text(userDog.userDogs[userDog]?.dogBreed ?? "")
//            }
//        }
    }
}

struct MyDogsView_Previews: PreviewProvider {
    static var previews: some View {
        MyDogsView()
    }
}
