//
//  TypographyAttributedText.swift
//  TypographyLibrary
//
//  Created by chetan on 11/02/22.
//

import Foundation
import UIKit

//MARK:- This is use for the add italic text on the label

extension NSMutableAttributedString {
    
    var fontSize:CGFloat { return 16 }
    var italicFont:UIFont { return UIFont(name: "Roboto-Light", size: fontSize - 2) ?? .italicSystemFont(ofSize: fontSize - 2)}
    var bodyFont:UIFont { return UIFont(name: "Roboto-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize) }
    
    func bodyText(_ value: String) -> NSMutableAttributedString {
        let attributes:[NSAttributedString.Key : Any] = [
            .font : bodyFont
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func bodyItalicText(_ value: String) -> NSMutableAttributedString {
        let attributes:[NSAttributedString.Key : Any] = [
            .font : italicFont
        ]
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}
