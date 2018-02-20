//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        SVProgressHUD.show()
        if let unwrappedEmail = emailTextfield.text, let unwrappedPassword = passwordTextfield.text {
            Auth.auth().signIn(withEmail: unwrappedEmail, password: unwrappedPassword) { (user, error) in
                
                if error != nil {
                    print(error!)
                    SVProgressHUD.dismiss()
                } else {
                    print("Login was successful!")
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
        } else {
            print("The fields were empty!")
        }
    }
    


    
}  
