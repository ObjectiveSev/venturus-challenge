//
//  HotelsService.swift
//  Venturus Challenge
//
//  Created by Thiago Augusto on 24/07/20.
//  Copyright © 2020 objectivesev. All rights reserved.
//

import Foundation
import PromiseKit

protocol ISearchService {
    typealias ImagesHandler = (NetworkResult<QueryResult, NetworkError, Int>) -> Void
    
    func getImages(query: String, handler: @escaping ImagesHandler)
}

class SearchService: NetworkBaseService, ISearchService {
    func getImages(query: String, handler: @escaping ImagesHandler) {
        let path = "gallery/search"
        let parameters: [String: Any] = ["q": query]
        let service = NetworkService(api: .imgurApi, path: path, parameters: parameters)
        NetworkDispatch.shared.get(service, handler: handler)
    }
}


//curl --location --request GET 'https://api.imgur.com/3/gallery/search/?q=cats' \
//--header 'Authorization: Client-ID 1ceddedc03a5d71'
