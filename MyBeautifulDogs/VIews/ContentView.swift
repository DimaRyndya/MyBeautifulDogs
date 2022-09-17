import SwiftUI

struct ContentView: View {
    var body: some View {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
