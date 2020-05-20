//
//  RespModel.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 09/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation

struct CharacterDataWrapper: Decodable {
    var code: Int?
    var status: String?
    var copyright: String?
    var attributionText: String?
    var attributionHTML: String?
    var etag: String?
    var data: CharacterDataContainer?
    
    static func characterDataWrapper(from data: Data) -> CharacterDataWrapper? {
        let decoder = JSONDecoder()
        
        guard let result = try? decoder.decode(CharacterDataWrapper.self, from: data) else {
            print("Error parsing data")
            return nil
        }
        return result
    }
}

struct CharacterDataContainer: Decodable {
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [Character]?
}

struct Character: Decodable {
    var id: Int?
    var name: String?
    var description: String?
    var modified: String?
    var thumbnail: Image?
    var resourceURI: String?
    var comics: ComicList?
    var series: SeriesList?
    var stories: StoryList?
    var events: EventList?
    var urls: [Url]?
}

struct Url: Decodable {
    var type: String?
    var url: String?
}

struct Image: Decodable {
    var path: String?
    var imageExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}

struct ComicList: Decodable {
    var available: Int?
    var collectionURI: String?
    var items: [ComicSummary]?
    var returned: Int?
}

struct ComicSummary: Decodable {
    var resourceURI: String?
    var name: String?
}

struct StoryList: Decodable {
    var available: Int?
    var collectionURI: String?
    var items: [StorySummary]?
    var returned: Int?
}

struct StorySummary: Decodable {
    var resourceURI: String?
    var name: String?
    var type: String?
}

struct EventList: Decodable {
    var available: Int?
    var collectionURI: String?
    var items: [EventSummary]?
    var returned: Int?
}

struct EventSummary: Decodable {
    var resourceURI: String?
    var name: String?
}

struct SeriesList: Decodable {
    var available: Int?
    var collectionURI: String?
    var items: [SeriesSummary]?
    var returned: Int?
}

struct SeriesSummary: Decodable {
    var resourceURI: String?
    var name: String?
}

