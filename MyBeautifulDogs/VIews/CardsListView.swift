import SwiftUI

struct CardsListView: View {
    let dogStore = DogStore()

    var body: some View {
        List(0..<dogStore.dogs.count, id: \.self) { dog in
            HStack {
                SingleCardView(index: dog)
                Text(dogStore.dogs[dog].dogBreed)
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
    }
}
