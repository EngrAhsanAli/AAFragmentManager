//
//  ViewController.swift
//  AAFragmentManager
//
//  Created by Engr. Ahsan Ali on 01/04/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit
import AAFragmentManager

class ViewController: UIViewController {

    @IBOutlet weak var childView: AAFragmentManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let identifiers: [String] = ["ChlidVC1", "ChlidVC2", "ChlidVC3", "ChlidVC4", "ChlidVC5"]
        let arrayVC = getViewControllers(identifiers)
        
        childView.setupFragments(arrayVC, defaultIndex: 0)

        
    }
    
    func getViewControllers(_ identifiers: [String]) -> [UIViewController] {
        var viewControllers = [UIViewController]()
        identifiers.forEach { (id) in
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            viewControllers.append(storyboard.instantiateViewController(withIdentifier: id))
        }
        return viewControllers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func replaceViewAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        childView.replaceFragment(index: index)
    }
}

