import SwiftUI

private enum Dimensions {
    static let cornerRadius: CGFloat = 20
    static let dogDetailCardSize = CGSize(width: 350, height: 400)
    static let mainScreenCardSize = CGSize(width: 180, height: 150)
}

struct SingleCardView: View {
    var dogImage: String
    
    var body: some View {
        Image(dogImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
                width: Dimensions.mainScreenCardSize.width,
                height: Dimensions.mainScreenCardSize.height)
            .cornerRadius(Dimensions.cornerRadius)

    }
    
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView(dogImage: "border")
    }
}
