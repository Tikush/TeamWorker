//
//  NewsManager.swift
//  Lecture 28
//
//  Created by Nika Kirkitadze on 08.06.21.
//

import Foundation

protocol ArticlesViewModelProtocol: AnyObject {
    func fetchArticles(completion: @escaping (([Articles]) -> Void))

}

class ArticlesViewModel: ArticlesViewModelProtocol {
    
    func fetchArticles(completion: @escaping (([Articles]) -> Void)) {
        let url = "https://run.mocky.io/v3/ab4f4c60-daf3-4e43-8148-8065d1178315"
        NetworkManager.shared.get(url: url) { (result: Result<ArticlesResponse, Error>) in
            switch result {
            case .success(let response):
                completion(response.articlesList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
