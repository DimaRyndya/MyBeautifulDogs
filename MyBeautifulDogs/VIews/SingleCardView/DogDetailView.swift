import SwiftUI

struct DogDetailView: View {
    @EnvironmentObject var viewState: ViewState
    
    let dog = DogStore()

    var body: some View {
        VStack {
            Image(dog.dogs[0].dogImage)
            Text(dog.dogs[0].dogBreed)
        }
    }
}

struct DogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogDetailView()
            .environmentObject(ViewState())
    }
}
