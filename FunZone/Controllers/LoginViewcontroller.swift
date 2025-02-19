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
        badCredentialsLabel.isHidden = true
        handleFieldsFillout()
        // Do any additional setup after loading the view.
    }
    var keychainUsername : String?
    var keychainPass : String?
    
    @IBOutlet weak var badCredentialsLabel: UILabel!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    
    @IBAction func validate(_ sender: Any) {
        if(username.text!.isEmpty || password.text!.isEmpty){
            print("please enter credentials")
            badCredentialsLabel.isHidden = false
        }
        else{
            
            if let receivedUser = DBHelper.shared.getUser(username: username.text!){
                if password.text! != receivedUser.password {
                    print("password not right")
                    badCredentialsLabel.isHidden = false
                }
                else{
                    print("validate check \(username.text!)")
                    badCredentialsLabel.isHidden = true
                    UsernameManager.shared.username = username.text!
                    handleRememberMe(rememberSwitch: rememberMeSwitch)

                    tabsVC(self)
                }
            }
            else{
                badCredentialsLabel.isHidden = false
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


//Handle keychain
extension LoginViewcontroller {
    func handleRememberMe(rememberSwitch: UISwitch){
        let curUsername = username.text!
        let wasReceived = receiveUsernameFromKeychain()
        username.text! = curUsername
        if rememberSwitch.isOn == true{
            if wasReceived == false {
                addUserNameInKeychain()
                addPasswordInKeychain()
            }
            else{
                updateUserNameInKeychain()
                updatePasswordInkeychain()
            }
        }
        else {
            if wasReceived == true {
                if let unwrappedUsername = keychainUsername{
                    if unwrappedUsername == username.text!{
                        deleteUsernameFromKeychain()
                        deletePasswordFromKeychain()
                    }
                }
            }
        }
    }
    
    func handleFieldsFillout() {
        receiveUsernameFromKeychain()
        receivePasswordFromKeychain()
    }
    
    func addUserNameInKeychain() {
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "username",
            kSecValueData as String: username.text!.data(using: .utf8)!]
        if SecItemAdd(attributes as CFDictionary, nil) == errSecSuccess{
            print("username added succesfully")
        }
        else{
            print("username not added")
        }
    }
    
    func addPasswordInKeychain() {
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "password",
            kSecValueData as String: password.text!.data(using: .utf8)!]
        if SecItemAdd(attributes as CFDictionary, nil) == errSecSuccess{
            print("pass added succesfully")
        }
        else{
            print("pass not added")
        }
    }
    
    func updateUserNameInKeychain(){
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "username"]
        let attributes: [String: Any] = [
            kSecValueData as String: username.text!.data(using: .utf8)!
        ]
        print(username.text!)
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        if  status == errSecSuccess{
            print("username saved succesfully in keychain")
        }
        else{
            print("username not saved in keychain \(status)")
        }
        
    }
    
    func updatePasswordInkeychain() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "password"]
        let attributes: [String: Any] = [
            kSecValueData as String: password.text!.data(using: .utf8)!
        ]
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        if  status == errSecSuccess{
            print("password saved succesfully in keychain")
        }
        else{
            print("password not saved in keychain \(status)")
        }
    }
    
    func receiveUsernameFromKeychain() -> Bool{
        let request : [String : Any] = [kSecClass as String : kSecClassGenericPassword,
                                        kSecAttrAccount as String : "username",
                                        kSecReturnAttributes as String : true,
                                        kSecReturnData as String : true]
        var response : CFTypeRef?
        
        if SecItemCopyMatching(request as CFDictionary, &response) == noErr {
            let data = response as? [String: Any]
            let userKey = data?[kSecAttrAccount as String] as? String
            let receivedUser = (data![kSecValueData as String] as? Data)!
            var receivedUserStr = String(data: receivedUser, encoding: .utf8)
            print(receivedUserStr)
            username.text! = receivedUserStr!
            keychainUsername = receivedUserStr!
            return true
        }
        else{
            print("no saved username detected")
            return false
        }
    }
    
    func receivePasswordFromKeychain() -> Bool {
        let request : [String : Any] = [kSecClass as String : kSecClassGenericPassword,
                                        kSecAttrAccount as String : "password",
                                        kSecReturnAttributes as String : true,
                                        kSecReturnData as String : true]
        var response : CFTypeRef?
        
        if SecItemCopyMatching(request as CFDictionary, &response) == noErr {
            let data = response as? [String: Any]
            let passKey = data?[kSecAttrAccount as String] as? String
            let pass = (data![kSecValueData as String] as? Data)!
            var passStr = String(data: pass, encoding: .utf8)
            print(passStr)
            password.text! = passStr!
            keychainPass = passStr!
            return true
        }
        else{
            print("no saved password detected")
            return false
        }
    }
    
    func deleteUsernameFromKeychain() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "username"]
        let status = SecItemDelete(query as CFDictionary)
        if  status == errSecSuccess{
            print("username deleted succesfully in keychain")
        }
        else{
            print("username not deleted in keychain \(status)")
        }
    }
    
    func deletePasswordFromKeychain() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "password"]
        let status = SecItemDelete(query as CFDictionary)
        if  status == errSecSuccess{
            print("password deleted succesfully in keychain")
        }
        else{
            print("password not deleted in keychain \(status)")
        }
    }
}
