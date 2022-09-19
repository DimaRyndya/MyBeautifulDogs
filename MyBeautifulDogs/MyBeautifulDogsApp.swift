import SwiftUI

@main
struct MyBeautifulDogsApp: App {
    @StateObject var viewState = ViewState()
    @State private var selectedTab = 1
    @StateObject var dogStore = DogStore()

    var body: some Scene {
        WindowGroup {
            ContentView(selectedTab: $selectedTab)
                .environmentObject(viewState)
                .environmentObject(dogStore)
        }
    }
}
