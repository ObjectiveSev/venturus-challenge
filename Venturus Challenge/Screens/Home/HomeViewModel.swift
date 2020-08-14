//
//  HomeViewModel.swift
//  Venturus Challenge
//
//  Created by Thiago Augusto on 23/07/20.
//  Copyright © 2020 objectivesev. All rights reserved.
//

import Foundation

enum HomeViewModelAction {
    case reload, failure(error: Error, code: Int), empty
}

protocol HomeViewModelDelegate: class {
    func didSelectAction(_ action: HomeViewModelAction)
}

class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    
    private let searchService: ISearchService
    
    private var images = [Image]()
    
    init(searchService: ISearchService) {
        self.searchService = searchService
    }
    
    func getItems() {
        loadItems()
    }
    
    func numberOfRowsIn(_ section: Int) -> Int {
        images.count
    }
    
    func itemAt(_ indexPath: IndexPath) -> Image {
        images[indexPath.row]
    }
}

private extension HomeViewModel {
    func loadItems() {
        searchService.getImages(query: "cats") { result in
            switch result {
            case .failure(let error, let code):
                self.delegate?.didSelectAction(.failure(error: error, code: code))
            case .success(let result, _):
                self.images = []
                result.data?.items?.forEach { itemResult in
                    if (itemResult.primary?.string ?? .none) == .post {
                        itemResult.items?.forEach { post in
                            post.post?.images?.forEach { image in
                                self.images.append(image)
                            }
                        }
                    }
                }
                self.delegate?.didSelectAction(.reload)
            }
        }
    }
}
