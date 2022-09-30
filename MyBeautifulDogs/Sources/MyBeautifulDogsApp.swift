import SwiftUI

@main
struct MyBeautifulDogsApp: App {
    @StateObject var viewState = ViewState()
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewState)
                .environmentObject(viewModel)
                .onAppear {
                    print(FileManager.documentURL ?? "")
                }
        }
    }
}
