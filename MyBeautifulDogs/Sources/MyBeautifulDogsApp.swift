import SwiftUI

@main
struct MyBeautifulDogsApp: App {
    @StateObject var viewState = ViewState()
    @StateObject var viewModel = ViewModel()
    @State private var selectedTab = 1


    
    var body: some Scene {
        WindowGroup {
            MainView(selectedTab: $selectedTab)
                .environmentObject(viewState)
                .environmentObject(viewModel)
                .onAppear {
                    print(FileManager.documentURL ?? "")
                }
        }
    }
}
