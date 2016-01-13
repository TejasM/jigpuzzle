//
//  PreviewViewController.swift
//  PuzzleMe
//
//  Created by Tejas Mehta on 2016-01-13.
//  Copyright © 2016 Tejas Mehta. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    var image: UIImage?;
    
    @IBOutlet weak var previewImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewImageView.image = image
        // Do any additional setup after loading the view.
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
