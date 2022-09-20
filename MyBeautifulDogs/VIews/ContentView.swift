import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewState: ViewState
    @Binding var selectedTab: Int


    var body: some View {
        if viewState.showAllCards {
            TabView(selection: $selectedTab) {
                MainView()
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
        ContentView(selectedTab: .constant(1))
            .environmentObject(ViewState())
            .environmentObject(ViewModel())
    }
}
