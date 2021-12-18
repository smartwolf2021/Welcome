//
//  MoreInfoViewController.swift
//  Welcome
//
//  Created by Тагир Садыков on 18.12.2021.
//

import UIKit

class MoreInfoViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var personInfo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = personInfo        
    }
   
    
}
