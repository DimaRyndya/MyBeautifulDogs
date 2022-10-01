import SwiftUI

private enum Configurations {
    static let myDogsTitle = "My Dogs"
}

private enum Dimensions {
    static let cornerRadius: CGFloat = 20
    static let dogDetailCardSize = CGSize(width: 350, height: 400)
    static let mainScreenCardSize = CGSize(width: 180, height: 150)
    static let offsetX: CGFloat = 160
    static let offsetY: CGFloat = -65
}

struct MyDogsView: View {
    @EnvironmentObject var myDogs: MyDogsModel
    
    var allDogs: AllDogsModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List(0..<myDogs.getSavedDogs().count, id: \.self) { selectedDog in
                    ZStack {
                        HStack {
                            Image(myDogs.getSavedDogInfo(for: selectedDog).breedName?.dogImage ?? "")
                                .resizable()
                                .frame(
                                    width: Dimensions.mainScreenCardSize.width,
                                    height: Dimensions.mainScreenCardSize.height)
                                .cornerRadius(Dimensions.cornerRadius)
                                .scaledToFit()

                            VStack {
                                Text(myDogs.getSavedDogInfo(for: selectedDog).dogName)
                                Text(myDogs.getSavedDogInfo(for: selectedDog).breedName?.dogBreed ?? "")
                            }
                        }
                        Button(action: { myDogs.removeSavedDog(for: selectedDog) }) {
                            Image(systemName: "xmark")
                                .font(.title3)
                                .foregroundColor(.blue)
                                .padding()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .offset(x: Dimensions.offsetX, y: Dimensions.offsetY)
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: DogModalView(allDogs: allDogs)) {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .padding()

                        }
                        .navigationBarTitle(Configurations.myDogsTitle)
                        .padding()
                    }
                }
            }
            
        }
    }
}


struct MyDogsView_Previews: PreviewProvider {
    static var previews: some View {
        MyDogsView(allDogs: AllDogsModel())
            .environmentObject(MyDogsModel())
    }
}
