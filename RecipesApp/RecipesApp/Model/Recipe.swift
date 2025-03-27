

import Foundation

struct RecipeResponse: Codable {
    let meals: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let id: String
    let name: String
    let category: String
    let area: String
    let instructions: String
    let thumbnail: String
    let youtube: String

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case youtube = "strYoutube"
    }
}

