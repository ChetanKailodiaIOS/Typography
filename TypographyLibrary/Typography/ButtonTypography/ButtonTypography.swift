//
//  ButtonTypography.swift
//  TypographyLibrary
//
//  Created by chetan on 14/02/22.
//

import Foundation
import UIKit


extension UIButton {
    
    @IBInspectable var fontSizeKey: String? {
        get {
            return self.titleLabel?.font.fontName
        }
        set {
            let fontName = getFontName(newValue ?? "default")
            let size = getFontSize(newValue ?? "17.0")
            self.titleLabel?.font = UIFont(name: fontName, size: size)
            //let color = getTextColor(newValue ?? "default")
            //self.setTitleColor(color, for: .normal)
        }
    }
}
