//
//  APIService.swift
//  AmiraclePodcast
//
//  Created by Amir Nickroo on 10/12/18.
//  Copyright © 2018 Amir Nickroo. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    
    func fetchPodcasts(text: String, completionHandler: @escaping ([Podcast]) -> ()) {
        print("fetching podcast")
        let url = "https://itunes.apple.com/search"
        let params = ["term": text, "media": "podcast"]
//                let params = ["term": text]
        
                Alamofire.request(url, method: .get, parameters: params , encoding: URLEncoding.default, headers: nil).responseData { (responseData) in
                    if let err = responseData.error {
                        print("Failed to contact itunes api", err)
                        return
                    }
                    guard let data = responseData.data else {
                        return
                    }
                    do {
                        let searchResults = try JSONDecoder().decode(SearchResults.self, from: data)
                            completionHandler(searchResults.results)
                    } catch let decodeError {
                        print("Failed to decode...", decodeError)
                    }
                }
        
    }
    
    struct SearchResults: Decodable {
        let resultCount: Int
        let results: [Podcast]
        
        
    }
    
}
