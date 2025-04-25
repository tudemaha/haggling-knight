import Foundation

struct PhraseCategory: Identifiable, Codable {
    var id: Int
    var image: String
    var title: String
    var active: Bool
}

struct Phrase: Identifiable, Codable {
    var id: Int
    var phrase: String
    var translate: String
    var meaning: String
    var example: [String]
    var category_id: Int
    var audio: String
    var saved: Bool
}
