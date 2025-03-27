
import Foundation
import Moya
//func fetchRecipe(recipeName:String) async throws -> [Recipe] {
//    
//    let apiLink = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(recipeName)"
//    
//    guard let url = URL(string: apiLink) else { throw RecipeErrors.invalidURL }
//    
//    let (data,response) = try await URLSession.shared.data(from: url)
//    
//    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw RecipeErrors.invalidResponse }
//    
//    do {
//        let decoder = JSONDecoder()
//        let recipesData = try decoder.decode(RecipeResponse.self, from: data)
//        return recipesData.meals
//    }
//    catch {
//        throw RecipeErrors.decodingFailed
//    }
//}

func fetchRecipe(recipeName:String) async throws -> [Recipe] {
    let provider = MoyaProvider<RecipeApi>()
    let response = try await provider.request(.search(recipeName:recipeName))
    let recipesData = try JSONDecoder().decode(RecipeResponse.self, from: response.data)
    return recipesData.meals
}
enum RecipeApi {
    case search(recipeName:String)
}
extension RecipeApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.themealdb.com/api/json/v1/1")!
    }
    
    var path: String {
        return "search.php"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .search(let recipeName):
            return .requestParameters(parameters: ["s": recipeName], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

extension MoyaProvider {
    func request(_ request : Target)async throws -> Response {
        return try await withCheckedThrowingContinuation { continuation in
            self.request(request) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
