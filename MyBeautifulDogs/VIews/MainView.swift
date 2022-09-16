import SwiftUI

struct MainView: View {
    @EnvironmentObject var dog: Dog

    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 10),
        GridItem(.adaptive(minimum: 120), spacing: 10)
    ]

    var body: some View {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(0..<dog.dogImages.count) { index in
                        SingleCardView(index: index)
                    }
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Dog())
    }
}
