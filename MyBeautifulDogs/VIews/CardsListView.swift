import SwiftUI

struct CardsListView: View {
    let dogStore = DogStore()

    var body: some View {
        List(0..<dogStore.dogs.count, id: \.self) { index in
            HStack {
                SingleCardView(index: index)
                Text(dogStore.dogs[index].dogBreed)
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
    }
}
