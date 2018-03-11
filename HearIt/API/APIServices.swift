//
//  APIServices.swift
//  HearIt
//
//  Created by Siddique on 11/03/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    let baseiTunesSearchURl = "https://itunes.apple.com/search"
    
    //service is a singleton
    static let shared = APIService()
    func fetchPodcasts(using searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
        let parameters = ["term": searchText,"media": "podcast"]
        
        Alamofire.request(baseiTunesSearchURl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("Failed to contact server: \(err.localizedDescription)")
                return
            }
            guard let data = dataResponse.data else {
                return
            }
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                completionHandler(searchResult.results)
            } catch let decodeError {
                print("Failed to decode: \(decodeError.localizedDescription)")
            }
        }
    }
    struct SearchResults: Decodable {
        let resultCount: Int
        let results: [Podcast]
    }
}
