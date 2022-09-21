import SwiftUI

@main
struct MyBeautifulDogsApp: App {
    @StateObject var viewState = ViewState()
    @State private var selectedTab = 1
    @StateObject var viewModel = ViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(selectedTab: $selectedTab)
                .environmentObject(viewState)
                .environmentObject(viewModel)
                .onAppear {
                  print(FileManager.documentURL ?? "")
                }
        }
    }
}
