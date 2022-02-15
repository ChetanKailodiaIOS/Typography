//
//  LabelTypography.swift
//  TypographyLibrary
//
//  Created by chetan on 11/02/22.
//

import Foundation
import UIKit

extension UILabel {
    
    @IBInspectable var fontSizeKey: String? {
        get {
            return self.font.fontName
        }
        set {
            let fontName = getFontName(newValue ?? "default")
            let size = getFontSize(newValue ?? "17.0")
            self.font = UIFont(name: fontName, size: size)
        }
    }
    
}
