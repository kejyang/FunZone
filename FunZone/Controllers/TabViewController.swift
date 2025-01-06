//
//  TabViewController.swift
//  FunZone
//
//  Created by admin on 1/4/25.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.hidesBackButton = true
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
