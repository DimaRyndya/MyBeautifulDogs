import SwiftUI

struct SingleCardView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var index: Int
    
    var body: some View {
        Image(viewModel.dogStore.allDodBreeds[index].dogImage)
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
            .environmentObject(ViewModel())
    }
}
