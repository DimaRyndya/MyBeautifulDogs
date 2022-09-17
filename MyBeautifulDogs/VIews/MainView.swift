import SwiftUI

struct MainView: View {
    let dogStore = DogStore()

    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10),
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]

    var body: some View {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(0..<dogStore.dogs.count) { index in
                        SingleCardView(index: index)
                    }
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
