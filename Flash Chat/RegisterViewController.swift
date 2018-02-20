//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        SVProgressHUD.show()
        
        //TODO: Set up a new user on our Firbase database
        if let unwrappedEmail = emailTextfield.text, let unwrappedPassword = passwordTextfield.text {
            Auth.auth().createUser(withEmail: unwrappedEmail, password: unwrappedPassword) { (user, error) in
                if error != nil {
                    print(error!)
                    SVProgressHUD.dismiss()
                } else {
                    // success
                    print("Registration Successful!")
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
        } else {
            print("The fields were empty!")
        }

        

        
        
    } 
    
    
}
