import SwiftUI

enum BreedName: Identifiable {
    var id: Int {
        hashValue
    }

    case BostonTerrier
    case StBernardPuppy
    case CaneCorso
    case ChowChow
    case Border
    case PembrokeWelshCorgi
    case Beagle
    case YorkshireTerrier
    case Pomeranian
    case FrenchBulldog

    var dogBreed: String {
        switch self {
        case .BostonTerrier:
           return  "Boston Terrier"
        case .StBernardPuppy:
           return  "St Bernard Puppy"
        case .CaneCorso:
           return  "Cane Corso"
        case .ChowChow:
           return  "Chow Chow"
        case .Border:
           return  "Border"
        case .PembrokeWelshCorgi:
           return  "Pembroke WelshCorgi"
        case .Beagle:
           return  "Beagle"
        case .YorkshireTerrier:
           return  "Yorkshire Terrier"
        case .Pomeranian:
           return  "Pomeranian"
        case .FrenchBulldog:
           return  "French Bulldog"

        }
    }

    var dogImage: String {
        switch self {
        case .BostonTerrier:
           return  "boston-terrier"
        case .StBernardPuppy:
           return  "st-bernard-puppy"
        case .CaneCorso:
           return  "cane-corso"
        case .ChowChow:
           return  "chowchow"
        case .Border:
           return  "border-collie"
        case .PembrokeWelshCorgi:
           return  "pembroke-welsh-corgi"
        case .Beagle:
           return  "beagle"
        case .YorkshireTerrier:
           return  "yorkshire-terrier"
        case .Pomeranian:
           return  "pomeranian"
        case .FrenchBulldog:
           return  "french-bulldog"

        }
    }
}


