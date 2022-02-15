//
//  ViewController.swift
//  TypographyLibrary
//
//  Created by chetan on 10/02/22.
//

import UIKit

class LableViewController: UIViewController {
    
    @IBOutlet weak var italicTextLable: UILabel!
    @IBOutlet weak var textView: UIPlaceHolderTextView!
    @IBOutlet weak var characterLimitText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setItalicText()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "TextFieldViewController") as? TextFieldViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension LableViewController {
    
    func setItalicText() {
        textView.delegate = self
        self.characterLimitText.text = "Characters Limit: (250/250)"
        let text1 = "- Removal or mulching of "
        let text2 = "grass clippings"
        let text3 = " up to 1/2 cubic yard"
          italicTextLable.attributedText = NSMutableAttributedString().bodyText(text1).bodyItalicText(text2).bodyText(text3)
      }
}

extension LableViewController : UITextViewDelegate{
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == " " && range.location == 0 && range.length == 0 {
          return false
        }
        if textView == self.textView {
            if (textView.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! && text == "" {
                return false
            } else {
                let shortBio = "ZXCVBNMASDFGHJKLQWERTYUIOPzxcvbnmlkjhgfdsaqwertyuiop.,/@1234567890 "
                let charatorset = NSCharacterSet(charactersIn: shortBio).inverted
                let inputString = text.components(separatedBy: charatorset)
                if inputString.count == 1 {
                    let newlength:Int = (textView.text?.count)! + text.count - range.length
                    if newlength > 250 {
                        return false
                    } else {
                        self.characterLimitText.text = "Characters Limit: (\(250 - newlength)/250)"
                        return true
                    }
                }
            }
        }
        return false
    }
    
}
