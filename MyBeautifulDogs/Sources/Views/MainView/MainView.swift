import SwiftUI

enum Configuraions {
    static let dogsCards = "Dogs Cards"
    static let dogsList = "Dogs List"
    static let myDogs = "My Dogs"
    static let backButton = "Back"
    static let addDogButton = "Add Dog"
}

struct MainView: View {
    @EnvironmentObject var viewState: ViewState
    var allDogs = AllDogsModel()
    var myDogs = MyDogsModel()
    
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
                    MyDogsView(myDogs: myDogs, allDogs: allDogs)
                        .tabItem {
                            Image(systemName: "suit.heart")
                            Text(Configuraions.myDogs)
                        }
                        .tag(3)
                }
            }
        }
        if !viewState.showAllCards {
            NavigationView {
                DogDetailView(myDogs: myDogs)
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
    }
}
