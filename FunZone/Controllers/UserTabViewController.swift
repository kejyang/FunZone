//
//  UserTabViewController.swift
//  FunZone
//
//  Created by admin on 1/9/25.
//

import UIKit

class UserTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Welcome, \(UsernameManager.shared.username!)"
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var greetingLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
