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
    
    var number = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vcs = AAFragmentManager.getViewControllers(
            withIds: ["ChlidVC1", "ChlidVC2"],
            storyboard: "Main")
        

//        childView.initManager(viewControllers: vcs)

//        childView.initManager(viewControllers: vcs,
//                              parentViewController: self,
//                              identifier: .instance_1)

//        childView.initManager(fragments: [.id_frag_1, .id_frag_2])
        
        childView.initManager(fragments: [.id_frag_1, .id_frag_2],
                              parentViewController: self,
                              identifier: .instance_1)
        
        childView.nextTransition = kCATransitionFromTop
        childView.prevTransition = kCATransitionFromBottom

        let fragment1 = childView.getFragment(withIndex: 0) as! Fragment1
        fragment1.parentVC = self
        
        let frag = childView.getFragment(fragment: .id_frag_1) as! Fragment1
        frag.clickAction(self)

//        AAFragmentManager.vc_frag_1.clickAction(self)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func replaceViewAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        childView.replace(withIndex: index)
//        childView.replace(withfragment: .id_frag_1)
    }
    
    @IBAction func previousAction(_ sender: Any) {
        childView.previous()
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if let manager = AAFragmentManager.getInstance(withIdentifier: .instance_1),
            let parent = manager.parentViewController as? ViewController {
            manager.next()
            parent.calledByParent()
            
        }
        else {
            childView.next()
        }
    }
    
    func calledByParent() {
        print("Called by Parent")
    }
    
}

extension AAFragmentManager {
    
    static let instance_1 = AAFragmentManagerInstance("SampleIdentifier")
    static let instance_2 = AAFragmentManagerInstance("SampleIdentifier2")
    
    static let id_frag_1 = AAFragment("ChlidVC1", storyboard: "Main")
    static let id_frag_2 = AAFragment("ChlidVC2", storyboard: "Main")
    
    static let vc_frag_1 = id_frag_1.viewsController as! Fragment1
    
}
