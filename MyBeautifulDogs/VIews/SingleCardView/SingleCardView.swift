import SwiftUI

struct SingleCardView: View {
    @EnvironmentObject var dog: Dog
    var index: Int

    var body: some View {
        Image(dog.dogImages[index])
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
            .environmentObject(Dog())
    }
}
