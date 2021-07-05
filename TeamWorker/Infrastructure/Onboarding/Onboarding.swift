//
//  OnboardingManager.swift
//  onbarding
//
//  Created by Beqa Tabunidze on 05.07.21.
//

import UIKit

struct Onboarding: Codable {
    
    let text: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case image = "image_url"
    }
}
