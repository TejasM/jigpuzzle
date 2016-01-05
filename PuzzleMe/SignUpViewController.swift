//
//  SignUpViewController.swift
//  PuzzleMe
//
//  Created by Tejas Mehta on 2015-12-26.
//  Copyright © 2015 Tejas Mehta. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var errorField: UILabel!
    let ref = Firebase(url: "https://puzzleme.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupClicked(sender: AnyObject) {
        let username = usernameField.text! as String
        let password = passwordField.text
        ref.createUser(username, password: password,
            withValueCompletionBlock: { error, authData in
                if error != nil {
                    // There was an error creating the account
//                    self.errorLabel.text = "Username/Password combination not found"
//                    self.errorLabel.hidden = false
                } else {
                    print(authData)
                // GO TO CAMERA VIEW
                    let newUser = [
                        "provider": "password",
                        "displayName": username
                    ]
                    
                    let uid = authData["uid"] as? String
                
                    self.ref.childByAppendingPath("users")
                        .childByAppendingPath(uid).setValue(newUser)
                
                    let cameraPageView = self.storyboard?.instantiateViewControllerWithIdentifier("CameraView")
                
                    self.navigationController?.pushViewController(cameraPageView!, animated: true)
                }
            })
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
