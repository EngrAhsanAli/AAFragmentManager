//
//  AAFragmentManager.swift
//  AAFragmentManager
//
//  Created by Engr. Ahsan Ali on 01/04/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit

open class AAFragmentManager: UIView {
    
    /// Transition object for animation between fragment
    open var transition: CATransition = CATransition()
    
    /// Allow same fragment to replace
    open var allowSameFragment: Bool = false
    
    /// Selected Fragment Index
    var selectedIndex: Int = -1

    /// Fragments
    var views: [UIViewController]?
    
    
    /// Init function
    ///
    /// - Parameter frame: frame
    override init (frame : CGRect) {
        super.init(frame : frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Init fragments with child view contrllers
    ///
    /// - Parameters:
    ///   - childViews: fragments
    ///   - defaultIndex: default fragment index
    open func setupFragments(_ childViews: [UIViewController], defaultIndex: Int = -1) {
        self.views = childViews
        setupTranstion()
        if viewExists(defaultIndex) {
            replaceFragment(withIndex: defaultIndex, shouldAnimate: false)
        }

    }
    
    /// Setup Animation
    func setupTranstion() {
        
        transition.duration = 0.3
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionReveal
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
    }
    

    /// Replaces fragment by index in current view
    ///
    /// - Parameters:
    ///   - index: fragment index
    ///   - animate: should animate
    ///   - fit: should fit in bounds
    open func replaceFragment(withIndex index: Int, shouldAnimate animate: Bool = true, shouldFit fit: Bool = true) {
        
        guard
            viewExists(index),
            let view = views?[index].view,
            !(!allowSameFragment && selectedIndex == index) else {
            return
        }
        
        removeSubviews()
        
        
        if animate {
            transition.subtype = selectedIndex > index ? kCATransitionFromLeft : kCATransitionFromRight
            self.layer.add(transition, forKey: kCATransition)
        }
        else {
            self.layer.removeAnimation(forKey: kCATransition)
        }
        
        selectedIndex = index

        let heightView = fit ? self : view
        view.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: heightView.frame.height)
        self.addSubview(view)

    }
    
    /// Replaces with next fragment if exists
    ///
    /// - Parameters:
    ///   - animate: should animate
    ///   - fit: should fit
    open func nextFragment(_ animate: Bool = true, shouldFit fit: Bool = true) {
        let nextIndex = selectedIndex + 1
        replaceFragment(withIndex: nextIndex, shouldAnimate: animate, shouldFit: fit)
    }
    
    /// Replaces with previous fragment if exists
    ///
    /// - Parameters:
    ///   - animate: should animate
    ///   - fit: should fit
    open func previousFragment(_ animate: Bool = true, shouldFit fit: Bool = true) {
        let nextIndex = selectedIndex - 1
        replaceFragment(withIndex: nextIndex, shouldAnimate: animate, shouldFit: fit)
    }
}


