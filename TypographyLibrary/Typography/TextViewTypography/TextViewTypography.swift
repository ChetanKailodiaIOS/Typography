//
//  TextViewTypography.swift
//  TypographyLibrary
//
//  Created by chetan on 14/02/22.
//

import Foundation
import UIKit

extension UITextView {
    
    @IBInspectable var fontSizeKey: String? {
        get {
            return self.font?.fontName
        }
        set {
            let fontName = getFontName(newValue ?? "default")
            let size = getFontSize(newValue ?? "17.0")
            self.font = UIFont(name: fontName, size: size)
        }
    }
}

class UIPlaceHolderTextView: UITextView {

//MARK: - Properties
@IBInspectable var placeholder: String?
@IBInspectable var placeholderColor: UIColor?
var placeholderLabel: UILabel?


//MARK: - Initializers
override func awakeFromNib() {
    super.awakeFromNib()


}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    // Use Interface Builder User Defined Runtime Attributes to set
    // placeholder and placeholderColor in Interface Builder.
    
    if self.placeholder == nil {
        self.placeholder = ""
    }

    if self.placeholderColor == nil {
        self.placeholderColor = UIColor.gray
    }

    NotificationCenter.default.addObserver(self, selector: #selector(textChanged(_:)),
                                           name: UITextView.textDidChangeNotification, object: nil)

}

    @objc func textChanged(_ notification: Notification) -> Void {
    if self.placeholder?.count == 0 {
        return
    }

    UIView.animate(withDuration: 0.25) {
        if self.text.count == 0 {
            self.viewWithTag(999)?.alpha = 1
        }
        else {
            self.viewWithTag(999)?.alpha = 0
        }
    }
}

// Only override draw() if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
    
override func draw(_ rect: CGRect) {
    super.draw(rect)

    if (self.placeholder?.count ?? 0) > 0 {
        if placeholderLabel == nil {
            placeholderLabel = UILabel.init()
            placeholderLabel?.lineBreakMode = .byWordWrapping
            placeholderLabel?.numberOfLines = 0
            placeholderLabel?.font = self.font
            placeholderLabel?.backgroundColor = self.backgroundColor
            placeholderLabel?.textColor = self.placeholderColor
            placeholderLabel?.alpha = 0
            placeholderLabel?.tag = 999
            self.addSubview(placeholderLabel!)

            placeholderLabel?.translatesAutoresizingMaskIntoConstraints = false
            placeholderLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
            placeholderLabel?.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
            placeholderLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            placeholderLabel?.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        }

        placeholderLabel?.text = self.placeholder
        placeholderLabel?.sizeToFit()
        self.sendSubviewToBack(self.placeholderLabel!)
    }

    if self.text.count == 0 && (self.placeholder?.count ?? 0) > 0 {
        self.viewWithTag(999)?.alpha = 1
    }
 }
    
}
