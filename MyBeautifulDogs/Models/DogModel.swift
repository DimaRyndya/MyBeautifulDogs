enum BreedName: Codable {
    
    case bostonTerrier
    case stBernardPuppy
    case caneCorso
    case chowChow
    case border
    case pembrokeWelshCorgi
    case beagle
    case yorkshireTerrier
    case pomeranian
    case frenchBulldog
    
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
            self = .bostonTerrier
        case "St Bernard Puppy":
            self = .stBernardPuppy
        case "Cane Corso":
            self = .caneCorso
        case "Chow Chow":
            self = .chowChow
        case "Border":
            self = .border
        case "Pembroke WelshCorgi":
            self = .pembrokeWelshCorgi
        case "Beagle":
            self = .beagle
        case "Yorkshire Terrier":
            self = .yorkshireTerrier
        case "Pomeranian":
            self = .pomeranian
        case "French Bulldog":
            self = .frenchBulldog
        default:
            throw CodingError.unknownValue
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.dogBreed, forKey: .breedName)
    }
    
    enum CodingKeys: CodingKey {
        case breedName
    }
}
