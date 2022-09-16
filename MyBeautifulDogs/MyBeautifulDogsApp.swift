import SwiftUI

@main
struct MyBeautifulDogsApp: App {
    @StateObject private var dog = Dog()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dog)
        }
    }
}
