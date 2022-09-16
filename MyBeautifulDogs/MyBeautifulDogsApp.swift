import SwiftUI

@main
struct MyBeautifulDogsApp: App {
    @StateObject private var dog = DogImages()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dog)
        }
    }
}
