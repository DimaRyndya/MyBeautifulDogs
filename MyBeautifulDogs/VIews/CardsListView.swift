import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var dog: Dog

    var body: some View {
        List(0..<dog.dogImages.count) { index in
            HStack {
                Image(dog.dogImages[index])
                    .resizable()
                    .frame(
                        width: Settings.mainScreenCardSize.width,
                        height: Settings.mainScreenCardSize.height)
                    .cornerRadius(20)
                Text(dog.breez[index])
            }
        }
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView()
            .environmentObject(Dog())
    }
}
