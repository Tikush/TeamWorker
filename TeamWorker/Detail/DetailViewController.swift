//
//  DetailViewController.swift
//  TeamWorker
//
//  Created by MacBook  on 05.07.21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var labelContent: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelAuthorName: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var article: Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure() {
        guard let article = article else {return}
        
        self.labelContent.text = article.content
        self.labelDate.text = article.publishedAt
        self.labelAuthorName.text = article.author
        self.labelTitle.text = article.title
        let imageURL = URL(string: article.urlToImage ?? "")
        image.kf.setImage(with: imageURL)
        authorImage.image = UIImage(named: "empty_avatar")
        authorImage.makeRounded()
        
    }
    
    
    
    @IBAction func onBack(_ sender: Any) {
        
        
    }
    @IBAction func onBookmarks(_ sender: Any) {
        
        
    }
    
}


