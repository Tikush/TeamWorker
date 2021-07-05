//
//  ProductsDataSource.swift
//  Lecture 44
//
//  Created by Nika Kirkitadze on 30.06.21.
//

import UIKit

class ArticlesDataSource: NSObject, UITableViewDataSource {
    
    private var tableView: UITableView!
    private var viewModel: ArticlesViewModelProtocol!
    private var articlesList = [Articles]()

    
    init(with tableView: UITableView, viewModel: ArticlesViewModel) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchArticles {  [weak self] articles in
            DispatchQueue.main.async {
                self?.articlesList = articles
                self?.tableView.reloadData()
            }
           
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(ArticlesCell.self, for: indexPath)
        cell.configure(with: articlesList[indexPath.row])
        
        return cell
    }
}

extension ArticlesDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            
    }
}
