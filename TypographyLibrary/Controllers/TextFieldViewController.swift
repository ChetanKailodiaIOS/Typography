//
//  TextFieldViewController.swift
//  TypographyLibrary
//
//  Created by chetan on 11/02/22.
//

import UIKit

class TextFieldViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func NextButton(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "TextViewViewController") as? TextViewViewController else {return}
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
