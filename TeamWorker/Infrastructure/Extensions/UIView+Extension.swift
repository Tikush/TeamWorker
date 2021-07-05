//
//  UIView+Extension.swift
//  onbarding
//
//  Created by Beqa Tabunidze on 05.07.21.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
