//
//  Fragment1.swift
//  AAFragmentManager
//
//  Created by Muhammad Ahsan on 03/02/2017.
//  Copyright © 2017 AA-Creations. All rights reserved.
//

import UIKit
import AAFragmentManager

class Fragment1: UIViewController {

    var parentVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Hi :-)",
                                      message: "Its triggered from fragment 1",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "I Got it!", style: .default, handler: nil))
        parentVC?.present(alert, animated: true, completion: nil)
        
//        AAFragmentManager.instance_1.parentViewController
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
