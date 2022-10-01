import SwiftUI

private enum Configuraions {
    static let dogsCards = "Dogs Cards"
    static let dogsList = "Dogs List"
    static let myDogsTitle = "My Dogs"
}

struct MainView: View {
    @EnvironmentObject var viewState: ViewState
    @EnvironmentObject var myDogs: MyDogsModel
    
    var allDogs = AllDogsModel()
    
    var body: some View {
        if viewState.showAllCards {
            HStack {
                TabView(selection: $viewState.selectedTab) {
                    DogsCardsView(allDogs: allDogs)
                        .tabItem {
                            Image(systemName: "house")
                            Text(Configuraions.dogsCards)
                        }
                        .tag(1)
                    CardsListView(allDogs: allDogs)
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text(Configuraions.dogsList)
                        }
                        .tag(2)
                    MyDogsView(allDogs: allDogs)
                        .tabItem {
                            Image(systemName: "suit.heart")
                            Text(Configuraions.myDogsTitle)
                        }
                        .tag(3)
                }
            }
        }
        if !viewState.showAllCards {
            NavigationView {
                DogDetailView()
                    .navigationBarTitleDisplayMode(.inline)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewState())
            .environmentObject(MyDogsModel())
    }
}
