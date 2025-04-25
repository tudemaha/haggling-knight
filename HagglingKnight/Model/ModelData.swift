import Foundation

@Observable
class ModelData {
    var phraseCategories: [PhraseCategory] = load("phrases-category.json")
    var phrases: [Phrase] = load("phrases.json")
    var priceCategories: [PriceCategory] = load("price-category.json")
    var prices: [Price] = load("prices.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't load \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) in main bundle: \n\(error)")
    }
    
    do {
        let decode = JSONDecoder()
        return try decode.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) a \(T.self):\n\(error)")
    }
}

func save<T: Encodable>(_ object: T, to filename: String) {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    do {
        let data = try encoder.encode(object)
        
        let fileURL = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(filename)
        
        try data.write(to: fileURL)
        print("Saved to: \(fileURL.path)")
    } catch {
        fatalError("Failed to save \(filename)")
    }
}
