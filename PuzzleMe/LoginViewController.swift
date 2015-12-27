//
//  LoginViewController.swift
//  PuzzleMe
//
//  Created by Tejas Mehta on 2015-12-26.
//  Copyright © 2015 Tejas Mehta. All rights reserved.
//

import UIKit
import Firebase

func isValidEmail(testStr:String) -> Bool {
    // println("validate calendar: \(testStr)")
    let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluateWithObject(testStr)
}

class LoginViewController: UIViewController {

    @IBOutlet weak var usernamefield: UITextField!
    
    @IBOutlet weak var passwordfield: UITextField!
    
    @IBOutlet weak var loginbutton: UIButton!
    
    //#import <Firebase/Firebase.h>
    let ref = Firebase(url: "https://<YOUR-FIREBASE-APP>.firebaseio.com/")
    
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTouch(sender: AnyObject) {
        let username = usernamefield.text
        let password = passwordfield.text
            //TODO: check with Firebase
            // Go to next screen
            // or display error
            //TODO:
            error.text = "Username/Password combination not found"
            error.hidden = false
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
