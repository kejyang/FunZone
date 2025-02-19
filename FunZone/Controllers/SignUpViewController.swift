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
        credentialErrorMsg.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    @IBOutlet weak var credentialErrorMsg: UILabel!
    
    @IBAction func validate(_ sender: Any) {
        if(username.text!.isEmpty || password.text!.isEmpty){
            print("please enter credentials")
            credentialErrorMsg.text! = "Please enter credentials!"
            credentialErrorMsg.isHidden = false
        }
        else if(password.text! != passwordConfirm.text!){
            print("passwords don't match!")
            credentialErrorMsg.text! = "Passwords do not match!"
            credentialErrorMsg.isHidden = false
        }
        else{
            if let existingUsername = DBHelper.shared.getUser(username: username.text!){
                print("User already exists")
                credentialErrorMsg.isHidden = false
                credentialErrorMsg.text! = "User already exists!"
            }
            else{
                DBHelper.shared.addUser(username: username.text!, password: password.text!)
                credentialErrorMsg.isHidden = true
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
