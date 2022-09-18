import SwiftUI

@main
struct MyBeautifulDogsApp: App {
    @StateObject var viewState = ViewState()
    @State private var selectedTab = 1
    

    var body: some Scene {
        WindowGroup {
            ContentView(selectedTab: $selectedTab)
                .environmentObject(viewState)
        }
    }
}
