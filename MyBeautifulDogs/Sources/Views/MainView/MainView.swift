import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewState: ViewState
    
    var body: some View {
        if viewState.showAllCards {
            HStack {
                TabView(selection: $viewState.selectedTab) {
                    DogsCardsView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Dogs Cards")
                        }
                        .tag(1)
                    CardsListView()
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("Dogs List")
                        }
                        .tag(2)
                    MyDogsView()
                        .tabItem {
                            Image(systemName: "suit.heart")
                            Text("My Dogs")
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
    }
}
