import SwiftUI

@main
struct MyBeautifulDogsApp: App {
@StateObject var viewState = ViewState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewState)
        }
    }
}
