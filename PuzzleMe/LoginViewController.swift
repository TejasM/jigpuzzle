//
//  LoginViewController.swift
//  PuzzleMe
//
//  Created by Tejas Mehta on 2015-12-26.
//  Copyright © 2015 Tejas Mehta. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    let ref = Firebase(url: "https://puzzleme.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for family: String in UIFont.familyNames()
        {
            print("\(family)")
            for names: String in UIFont.fontNamesForFamilyName(family)
            {
                print("== \(names)")
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func loginClick(sender: AnyObject) {
        let username = usernameField.text
        let password = passwordField.text
        ref.authUser(username, password: password) {
            error, authData in
            if error != nil {
                print("Login Error")
                if let errorCode = FAuthenticationError(rawValue: error.code) {
                    switch (errorCode) {
                    case .UserDoesNotExist:
                        self.errorLabel.text = "Username/Password combination not found"
                        self.errorLabel.hidden = false
                    case .InvalidEmail:
                        self.errorLabel.text = "Username/Password combination not found"
                        self.errorLabel.hidden = false
                    case .InvalidPassword:
                        self.errorLabel.text = "Username/Password combination not found"
                        self.errorLabel.hidden = false
                    default:
                        self.errorLabel.text = "Username/Password combination not found"
                        self.errorLabel.hidden = false
                    }
                }
                
            } else {
                KeychainWrapper.setString(username!, forKey: "UserId")
                KeychainWrapper.setString(password!, forKey: "UserPass")
                print("Login Success")
                
                let vc = self.storyboard!.instantiateViewControllerWithIdentifier("CameraView") as! CameraViewController
                self.presentViewController(vc, animated: true, completion: nil)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
