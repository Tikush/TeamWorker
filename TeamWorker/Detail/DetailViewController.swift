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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func configure(with item: Articles ) {
        self.labelContent.text = item.content
        self.labelDate.text = item.publishedAt
        self.labelAuthorName.text = item.author
        self.labelTitle.text = item.title
        let imageURL = URL(string: item.urlToImage ?? "")
        image.kf.setImage(with: imageURL)
        authorImage.image = UIImage(named: "empty_avatar")
        authorImage.makeRounded()
        
    }
    
    
    
    @IBAction func onBack(_ sender: Any) {
        
        
    }
    @IBAction func onBookmarks(_ sender: Any) {
        
        
    }
    
}


