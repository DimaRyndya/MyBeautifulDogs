import SwiftUI

struct SingleCardView: View {
let dogStore = DogStore()

    var index: Int

    var body: some View {
        Image(dogStore.dogs[index].dogImage)
            .resizable()
            .frame(
                width: Settings.mainScreenCardSize.width,
                height: Settings.mainScreenCardSize.height)
            .cornerRadius(20)
    }
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView(index: 1)
    }
}
