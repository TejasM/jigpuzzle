//
//  InitialViewController.swift
//  PuzzleMe
//
//  Created by Amin's Mac on 2016-01-12.
//  Copyright © 2016 Tejas Mehta. All rights reserved.
//

import UIKit
import Firebase

class InitialViewController: UIViewController {
    let ref = Firebase(url: "https://puzzleme.firebaseio.com/")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if KeychainWrapper.hasValueForKey("UserId"){
            let username = KeychainWrapper.stringForKey("UserId")
            let password = KeychainWrapper.stringForKey("UserPass")
            ref.authUser(username, password: password) {
                error, authData in
                if error != nil {
                    print("Login Error")
                    KeychainWrapper.removeObjectForKey("UserId")
                    KeychainWrapper.removeObjectForKey("UserPass")
                    
                } else {
                    print("Login Success")
                    
                    let vc = self.storyboard!.instantiateViewControllerWithIdentifier("CameraView") as! CameraViewController
                    self.presentViewController(vc, animated: true, completion: nil)
                }
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
