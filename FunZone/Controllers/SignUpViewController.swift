//
//  SignUpViewController.swift
//  FunZone
//
//  Created by admin on 12/28/24.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func validate(_ sender: Any) {
        if(username.text!.isEmpty || password.text!.isEmpty){
            print("please enter credentials")
        }
        else{
            let attributes: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: username.text!,
                kSecValueData as String: password.text!.data(using: .utf8)!]
            if SecItemAdd(attributes as CFDictionary, nil) == errSecSuccess{
                print("data saved succesfully")
            }
            else{
                print("data not saved")
            }
        }
    }
}
