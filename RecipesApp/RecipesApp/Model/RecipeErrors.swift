

import Foundation
enum RecipeErrors: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingFailed
}
