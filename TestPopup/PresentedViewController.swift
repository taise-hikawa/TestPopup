//
//  PresentedViewController.swift
//  TestPopup
//
//  Created by Sakurako Shimbori on 2020/09/27.
//

import UIKit

class PresentedViewController: UIViewController {
    var textP:String!
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textLabel.text = textP
    }
}
