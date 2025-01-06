//
//  LoginViewcontroller.swift
//  FunZone
//
//  Created by admin on 12/28/24.
//

import UIKit

class LoginViewcontroller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func validate(_ sender: Any) {
        if(username.text!.isEmpty || password.text!.isEmpty){
            print("please enter credentials")
        }
        else{
            /*if(username.text! == "bob" && password.text! == "john"){
                print("Welcome, ", username.text!)
                self.performSegue(withIdentifier: "showTabController", sender: self)
            }
            else{
                print("invalid credentials")
            }*/
            let request : [String : Any] = [kSecClass as String : kSecClassGenericPassword, kSecAttrAccount as String : username.text!, kSecReturnAttributes as String : true, kSecReturnData as String : true]
            var response : CFTypeRef?
            
            if SecItemCopyMatching(request as CFDictionary, &response) == noErr {
                let data = response as? [String: Any]
                let userId = data?[kSecAttrAccount as String] as? String
                let pass = (data![kSecValueData as String] as? Data)!
                var passStr = String(data: pass, encoding: .utf8)
                
                if(userId! == username.text! && passStr! == password.text!){
                    tabsVC(self)
                }
            }
            
        }
        
    }
    
    
    @IBAction func signUpVC(_ sender: Any) {
        var story = UIStoryboard(name: "Main", bundle: nil)
        let signUpVC = story.instantiateViewController(withIdentifier: "signUp") as! SignUpViewController
        navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    func tabsVC(_ sender: Any) {
        performSegue(withIdentifier: "goToTabController", sender: self)
    }
    
    
    
}
