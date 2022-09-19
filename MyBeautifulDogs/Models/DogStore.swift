import SwiftUI

class DogStore: ObservableObject {
    let dogs: [BreedName] = [
        BreedName.bostonTerrier,
        BreedName.stBernardPuppy,
        BreedName.caneCorso,
        BreedName.chowChow,
        BreedName.border,
        BreedName.pembrokeWelshCorgi,
        BreedName.beagle,
        BreedName.yorkshireTerrier,
        BreedName.pomeranian,
        BreedName.frenchBulldog

    ]

    @Published var userDogs: [BreedName] = []

    @Published var dogName = ""

    func addDog(dogCard: BreedName?) {
        if let dogCard = dogCard {
            userDogs.append(dogCard)
        }
    }
}



