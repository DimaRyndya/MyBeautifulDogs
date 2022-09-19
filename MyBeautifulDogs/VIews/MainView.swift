import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var viewModel: ViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10),
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(0..<viewModel.dogStore.allDodBreeds.count) { dog in
                    SingleCardView(index: dog)
                        .onTapGesture {
                            viewState.showAllCards.toggle()
                            viewState.selectedDogCard = viewModel.dogStore.allDodBreeds[dog]
                        }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewState())
            .environmentObject(ViewModel())
    }
}
