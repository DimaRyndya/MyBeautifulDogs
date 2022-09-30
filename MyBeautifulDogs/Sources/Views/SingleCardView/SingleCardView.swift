import SwiftUI

struct SingleCardView: View {
    var dogImage: String
    
    var body: some View {
        Image(dogImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(
                width: Settings.mainScreenCardSize.width,
                height: Settings.mainScreenCardSize.height)
            .cornerRadius(Dimensions.cornerRadius)

    }
    
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView(dogImage: "border")
            .environmentObject(ViewModel())
    }
}
