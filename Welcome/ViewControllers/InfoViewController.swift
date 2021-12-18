//
//  InfoViewController.swift
//  Welcome
//
//  Created by Тагир Садыков on 18.12.2021.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = person.name
        yearLabel.text = String(person.birthYear)
        hobbyLabel.text = person.hobby
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let moreInfoVC = segue.destination as! MoreInfoViewController
        moreInfoVC.personInfo = person.info
    }
    

}
