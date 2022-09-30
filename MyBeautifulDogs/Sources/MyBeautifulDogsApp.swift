import SwiftUI

@main
struct MyBeautifulDogsApp: App {
    @StateObject var viewState = ViewState()
    @StateObject var myDogs = MyDogsModel()

    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewState)
                //    .environmentObject(allDogs)
                .environmentObject(myDogs)
                .onAppear {
                    print(FileManager.documentURL ?? "")
                }
        }
    }
}
