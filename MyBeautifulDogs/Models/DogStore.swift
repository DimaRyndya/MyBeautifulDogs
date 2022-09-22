import SwiftUI


class DogStore {

     let allDogBreeds: [BreedName] = [
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

   private(set) var userDogs: [SavedDog] = []


    func addSavedDog(dogName: String, dogCard: BreedName?){
        var savedDog = SavedDog()
        if let dogCard = dogCard {
            savedDog.dogName = dogName
            savedDog.breedName = dogCard
        }
        userDogs.append(savedDog)
    }



//    func save(dog: String) {
//      do {
//        let encoder = JSONEncoder()
//        let data = try encoder.encode(self)
//        let filename = "\(dogName).rwcard"
//        if let url = FileManager.documentURL?
//          .appendingPathComponent(filename) {
//          try data.write(to: url)
//        }
//      } catch {
//        print(error.localizedDescription)
//      }
//    }



}



