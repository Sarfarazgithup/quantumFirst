import Foundation
import Alamofire

// MARK: - UserResponseModel
struct UserResponseModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}



// MARK: - Article
struct Article: Codable {
    let source: Source
    let author:String?
    let title:String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
/
}


// MARK: - Source
struct Source: Codable {
    let id, name: String?
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

