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
            .cornerRadius(20)

    }
    
}

struct SingleCardView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCardView(dogImage: "border")
            .environmentObject(ViewModel())
    }
}
