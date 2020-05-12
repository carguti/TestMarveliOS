//
//  SearchService.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 09/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation

class SearchService {
    var components = URLComponents()
    let baseURL = "gateway.marvel.com"
    let searchPath = "/v1/public/characters"
    let apiKey = "b097a95a95467fdf588ea67060cb9ffd"
    let hash = "cf62e345b8f27705ab191e2b0c20475e"
    var arrCharacters: [Character]?
    var limit: Int?
    var offset: Int?
    
    public func getCharacters(name: String?, limit: Int?, offset: Int?, completion: @escaping (CharacterDataWrapper) -> ()) {
        var urlComponents = URLComponents()
        let limit = limit
        let offset = offset
        urlComponents.scheme = "https"
        urlComponents.host = baseURL
        urlComponents.path = searchPath
        urlComponents.queryItems = [
           URLQueryItem(name: "apikey", value: apiKey),
           URLQueryItem(name: "ts", value: "1"),
           URLQueryItem(name: "hash", value: hash),
           URLQueryItem(name: "limit", value: "\(limit ?? 0)"),
           URLQueryItem(name: "offset", value: "\(offset ?? 0)")
        ]
        
        guard let url = urlComponents.url else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "error")
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                
                if let attributedString = try? NSAttributedString(data: data!, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                    print(attributedString)
                }
                
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                    guard let charactersData = CharacterDataWrapper.characterDataWrapper(from: data) else { return }
                    
                    completion(charactersData)
                }
            })
        }).resume()
    }
    
    public func getCharacter(id: String?, completion: @escaping (CharacterDataWrapper) -> ()) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = baseURL
        guard let characterId = id else { return }
        urlComponents.path = searchPath+"/"+characterId
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: apiKey),
            URLQueryItem(name: "ts", value: "1"),
            URLQueryItem(name: "hash", value: hash)
        ]
        
        guard let url = urlComponents.url else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "error")
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                
                if let attributedString = try? NSAttributedString(data: data!, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                    print(attributedString)
                }
                
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                    guard let characterWrapper = CharacterDataWrapper.characterDataWrapper(from: data) else { return }
                    
                    completion(characterWrapper)
                }
            })
        }).resume()
    }
}
