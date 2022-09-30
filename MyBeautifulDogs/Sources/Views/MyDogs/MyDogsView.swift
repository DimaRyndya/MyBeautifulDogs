import SwiftUI

struct MyDogsView: View {
    @EnvironmentObject var myDogs: MyDogsModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List(0..<myDogs.getSavedDogs().count, id: \.self) { selectedDog in
                    HStack {
                        Image(myDogs.getSavedDogInfo(for: selectedDog).breedName?.dogImage ?? "")
                            .resizable()
                            .frame(
                                width: Settings.mainScreenCardSize.width,
                                height: Settings.mainScreenCardSize.height)
                            .cornerRadius(Dimensions.cornerRadius)
                            .scaledToFit()
                        VStack {
                            Button(action: {myDogs.removeSavedDog(for: selectedDog) }) {
                                Image(systemName: "xmark.circle")
                            }
                            .buttonStyle(PlainButtonStyle())
                            Text(myDogs.getSavedDogInfo(for: selectedDog).dogName)
                            Text(myDogs.getSavedDogInfo(for: selectedDog).breedName?.dogBreed ?? "")
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                      Spacer()
                        NavigationLink(destination: DogModalView()) {
                            Image(systemName: "plus")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .padding()

                        }
                        .navigationBarTitle("My Dogs")
                        .padding()
                    }
                }
            }
            
        }
    }
}


struct MyDogsView_Previews: PreviewProvider {
    static var previews: some View {
        MyDogsView()
            .environmentObject(MyDogsModel())
    }
}
