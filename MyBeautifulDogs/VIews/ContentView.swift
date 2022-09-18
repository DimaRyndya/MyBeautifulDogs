import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewState: ViewState

    let dog = DogStore()

    var body: some View {
        if viewState.showAllCards {
            TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Dogs Cards")
                    }
                CardsListView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Dogs List")
                    }
                MyDogsView()
                    .tabItem {
                        Image(systemName: "suit.heart")
                        Text("My Dogs")
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
        ContentView()
            .environmentObject(ViewState())
    }
}
