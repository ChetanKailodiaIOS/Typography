//
//  TextViewViewController.swift
//  TypographyLibrary
//
//  Created by chetan on 11/02/22.
//

import UIKit

class TextViewViewController: UIViewController {

    @IBOutlet weak var textView: UIPlaceHolderTextView!
    
    @IBOutlet weak var characterLimitText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setStaticData()
    }
    
    func setStaticData() {
        textView.delegate = self
        self.characterLimitText.text = "Characters Limit: (250/250)"
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ButtonViewController") as? ButtonViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TextViewViewController : UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == " " && range.location == 0 && range.length == 0 {
          return false
        }
        
        if textView == self.textView {
            if (textView.text?.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty)! && text == "" {
                return false
            } else {
                let shortBio = "ZXCVBNMASDFGHJKLQWERTYUIOPzxcvbnmlkjhgfdsaqwertyuiop./@1234567890, "
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
