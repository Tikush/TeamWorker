//
//  ArticlesCell.swift
//  TeamWorker
//
//  Created by Tiko on 05.07.21.
//

import UIKit

class ArticlesCell: UITableViewCell {

    @IBOutlet weak var pictuere: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bigPicture: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var context: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bigPicture.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with item: Articles) {
        let url = URL(string: item.urlToImage ?? "")
        self.bigPicture.kf.setImage(with: url)
        self.authorLabel.text = item.author
        self.dateLabel.text = item.publishedAt
        self.context.text = item.content
    }
}
