//
//  OnboardingCollectionViewCell.swift
//  onbarding
//
//  Created by Beqa Tabunidze on 05.07.21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func setup(_ slide: OnboardingSlider) {
        
        backgroundImage.image = slide.image
        titleLabel.text = slide.title
        
    }
    
}
