import SwiftUI

enum BreedName: Codable {
//    case bostonTerrier = "Boston Terrier"
//    case stBernardPuppy = "St Bernard Puppy"
//    case caneCorso = "Cane Corso"
//    case chowChow = "Chow Chow"
//    case border = "Border"
//    case pembrokeWelshCorgi = "Pembroke WelshCorgi"
//    case beagle = "Beagle"
//    case yorkshireTerrier = "Yorkshire Terrier"
//    case pomeranian = "Pomeranian"
//    case frenchBulldog = "French Bulldog"

    case bostonTerrier(String)
    case stBernardPuppy(String)
    case caneCorso(String)
    case chowChow(String)
    case border(String)
    case pembrokeWelshCorgi(String)
    case beagle(String)
    case yorkshireTerrier(String)
    case pomeranian(String)
    case frenchBulldog(String)


    var dogBreed: String {
        switch self {
        case .bostonTerrier:
           return  "Boston Terrier"
        case .stBernardPuppy:
           return  "St Bernard Puppy"
        case .caneCorso:
           return  "Cane Corso"
        case .chowChow:
           return  "Chow Chow"
        case .border:
           return  "Border"
        case .pembrokeWelshCorgi:
           return  "Pembroke WelshCorgi"
        case .beagle:
           return  "Beagle"
        case .yorkshireTerrier:
           return  "Yorkshire Terrier"
        case .pomeranian:
           return  "Pomeranian"
        case .frenchBulldog:
           return  "French Bulldog"

        }
    }

    var dogImage: String {
        switch self {
        case .bostonTerrier:
           return  "boston-terrier"
        case .stBernardPuppy:
           return  "st-bernard-puppy"
        case .caneCorso:
           return  "cane-corso"
        case .chowChow:
           return  "chowchow"
        case .border:
           return  "border-collie"
        case .pembrokeWelshCorgi:
           return  "pembroke-welsh-corgi"
        case .beagle:
           return  "beagle"
        case .yorkshireTerrier:
           return  "yorkshire-terrier"
        case .pomeranian:
           return  "pomeranian"
        case .frenchBulldog:
           return  "french-bulldog"

        }
    }
    enum CodingError: Error {
        case unknownValue
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let breedName = try container.decode(String.self, forKey: .breedName)
        switch breedName {
        case "Boston Terrier":
            let breed = try container.decode(String.self, forKey: .breedName)
            self = .bostonTerrier(breed)
        case "St Bernard Puppy":
            let breed = try container.decode(String.self, forKey: .breedName)
            self = .stBernardPuppy(breed)
        case "Cane Corso":
            let breed = try container.decode(String.self, forKey: .breedName)
            self = .caneCorso(breed)
        case "Chow Chow":
            let breed = try container.decode(String.self, forKey: .breedName)
            self = .chowChow(breed)
        case "Border":
            let breed = try container.decode(String.self, forKey: .breedName)
            self = .border(breed)
        case "Pembroke WelshCorgi":
            let breed = try container.decode(String.self, forKey: .breedName)
            self = .pembrokeWelshCorgi(breed)
        case "Beagle":
            let breed = try container.decode(String.self, forKey: .breedName)
            self = .beagle(breed)
        case "Yorkshire Terrier":
            let breed = try container.decode(String.self, forKey: .breedName)
            self = .yorkshireTerrier(breed)
        case "Pomeranian":
            let breed = try container.decode(String.self, forKey: .breedName)
            self = .pomeranian(breed)
        case "French Bulldog":
            let breed = try container.decode(String.self, forKey: .breedName)
            self = .frenchBulldog(breed)
        default:
            throw CodingError.unknownValue
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .bostonTerrier:
            try container.encode("Boston Terrier", forKey: .breedName)
        case .stBernardPuppy:
            try container.encode("St Bernard Puppy", forKey: .breedName)
        case .caneCorso:
            try container.encode("Cane Corso", forKey: .breedName)
        case .chowChow:
            try container.encode("Chow Chow", forKey: .breedName)
        case .border:
            try container.encode("Border", forKey: .breedName)
        case .pembrokeWelshCorgi:
            try container.encode("Pembroke WelshCorgi", forKey: .breedName)
        case .beagle:
            try container.encode("Beagle", forKey: .breedName)
        case .yorkshireTerrier:
            try container.encode("Yorkshire Terrier", forKey: .breedName)
        case .pomeranian:
            try container.encode("Pomeranian", forKey: .breedName)
        case .frenchBulldog:
            try container.encode("French Bulldog", forKey: .breedName)
        }
    }

    enum CodingKeys: CodingKey {
        case breedName
    }
}


