//
//  ArticlesViewController.swift
//  TeamWorker
//
//  Created by Tiko on 05.07.21.
//

import UIKit

class ArticlesViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    private var dataSource: ArticlesDataSource!
    private var viewModel: ArticlesViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configureViewModel()
    }
    
    private func setupLayout() {
        tableView.registerNib(class: ArticlesCell.self)
    }

    private func configureViewModel() {
        viewModel = ArticlesViewModel()
        dataSource = ArticlesDataSource(with: tableView, viewModel: viewModel as! ArticlesViewModel)
        
        dataSource.refresh()
    }
}
