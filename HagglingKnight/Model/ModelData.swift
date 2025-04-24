import Foundation

@Observable
class ModelData {
    var phrasesCategory: [PhrasesCategory] = load("phrases-category.json")
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
