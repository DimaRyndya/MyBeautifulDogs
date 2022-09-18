import SwiftUI

struct DogStore {
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

}

class UserDogs {
    var userDogs: [BreedName] = []

 func addDog(dogCard: BreedName?) {
        if let dogCard = dogCard {
            userDogs.append(dogCard)
        }
     }

}


