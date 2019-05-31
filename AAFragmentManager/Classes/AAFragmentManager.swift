//
//  AAFragmentManager.swift
//  AAFragmentManager
//
//  Created by Engr. Ahsan Ali on 01/04/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

import UIKit
import ObjectiveC

open class AAFragmentManager: UIView {
    
    /// Transition object for animation between fragment
    open lazy var transition: CATransition = {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype(rawValue: CATransitionType.reveal.rawValue)
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        return transition
    }()
    
    /// Fragment previous transition
    open var prevTransition: String = convertFromCATransitionSubtype(.fromLeft)
    
    /// Fragment next transition
    open var nextTransition: String = convertFromCATransitionSubtype(.fromRight)
    
    /// Parent View Controller
    open var parentViewController: UIViewController?
    
    /// Selected Fragment Index
    var selectedIndex: Int = 0

    /// View Controllers
    var viewControllers = [UIViewController]()
    
    /// Fragments
    var fragments = [AAFragment]()
    
    /// Animation Identifier
    var animIdentifier = "AAFragmentManager"
    
    /// Instance Identifer
    static var identifier = "AAFragmentManager"
    
    /// Instance
    static var instance: AAFragmentManager? {
        get {
            return getInstance(key: AAFragmentManager.identifier)
        }
        set {
            setInstance(obj: newValue, key: AAFragmentManager.identifier)
        }
    }
    
    /// Init function
    ///
    /// - Parameter frame: frame
    override init (frame : CGRect) {
        super.init(frame : frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    /// Initialize the AAFragmentManager
    ///
    /// - Parameter viewControllers: Collection of UIViewController
    open func initManager(viewControllers: [UIViewController]) {
        
        self.viewControllers = viewControllers
        setTransition(transition: transition)
        current()
        
    }
    
    /// Initialize the AAFragmentManager
    ///
    /// - Parameters:
    ///   - viewControllers: Collection of UIViewController
    ///   - parentViewController: Super view controller for reference
    ///   - identifier: Instance identifier
    open func initManager(viewControllers: [UIViewController],
                           parentViewController: UIViewController,
                           identifier: AAFragmentManagerInstance) {
        
        self.parentViewController = parentViewController
        AAFragmentManager.identifier = identifier._id
        AAFragmentManager.instance = self
        initManager(viewControllers: viewControllers)
        
    }
    
    /// Initialize the AAFragmentManager
    ///
    /// - Parameter fragments: Collection of AAFragment
    open func initManager(fragments: [AAFragment]) {
        
        let viewControllers = getViewControllers(fromFragments: fragments)
        initManager(viewControllers: viewControllers)
        
    }
    
    /// Initialize the AAFragmentManager
    ///
    /// - Parameters:
    ///   - fragments: Collection of AAFragment
    ///   - parentViewController: Super view controller for reference
    ///   - identifier: Instance identifier
    open func initManager(fragments: [AAFragment],
                           parentViewController: UIViewController,
                           identifier: AAFragmentManagerInstance) {
        
        let viewControllers = getViewControllers(fromFragments: fragments)
        initManager(viewControllers: viewControllers, parentViewController: parentViewController, identifier: identifier)
        
    }
    
    func replaceFragment(view: UIView, insets: UIEdgeInsets, animate: Bool) {
        removeSubviews()
        animateFragment(animate)
        addAndFitSubview(view, insets: insets)
    }
    
    /// Animates the fragment if required
    private func animateFragment(_ animate: Bool) {
        if animate {
            self.layer.add(transition, forKey: animIdentifier)
        }
        else {
            self.layer.removeAnimation(forKey: animIdentifier)
        }
    }
    
    /// Converts the collection of AAFragment to the view controllers
    func getViewControllers(fromFragments: [AAFragment]) -> [UIViewController] {
        self.fragments = fromFragments
        return fragments.compactMap { $0.viewsController }
    }
    
    /// Empty current view
    func removeSubviews() {
        subviews.forEach({$0.removeFromSuperview()})
    }

    /// Adds the current fragment in superview
    func current() {
        replace(withIndex: selectedIndex, animate: false)
    }
}


// MARK: - Public methods
extension AAFragmentManager {
    
    /// Replaces with the next fragment if available
    open func next(_ animate: Bool = true) {
        let nextIndex = selectedIndex + 1
        replace(withIndex: nextIndex, animate: animate)
    }
    
    /// Replaces with the previous fragment if available
    open func previous(_ animate: Bool = true) {
        let nextIndex = selectedIndex - 1
        replace(withIndex: nextIndex, animate: animate)
    }
    
    /// Sets the transition for replacing the fragments
    open func setTransition(transition: CATransition) {
        self.transition = transition
    }
    
    /// Replaces with the previous fragment if available
    ///
    /// - Parameters:
    ///   - index: Index of required fragment
    ///   - insets: fragment insets
    ///   - nextPrevTransition: default next and previous transitions
    ///   - animate: should animate while replacing
    open func replace(withIndex index: Int,
                      insets: UIEdgeInsets = .zero,
                      nextPrevTransition: Bool = true,
                      animate: Bool = true) {
        
        guard let view = viewControllers[optional: index]?.view else { return }
        
        if nextPrevTransition {
            self.transition.subtype = convertToOptionalCATransitionSubtype(selectedIndex > index ? prevTransition : nextTransition)
        }
        
        selectedIndex = index
        replaceFragment(view: view, insets: insets, animate: animate)
        
    }
    
    open func replace(withfragment fragment: AAFragment,
                      insets: UIEdgeInsets = .zero,
                      animate: Bool = true) {
        
        guard let view = fragment.viewsController.view else { return }
        replaceFragment(view: view, insets: insets, animate: animate)
        
    }
    
    /// Get the fragment by index
    open func getFragment(withIndex: Int) -> UIViewController? {
        return viewControllers[optional: withIndex]
    }
    
    /// Get the fragment by AAFragment
    open func getFragment(fragment: AAFragment) -> UIViewController? {
        return self.fragments.filter { $0 == fragment }.first?.viewsController
    }
    
    /// Get view controllers with identifiers in specific storyboard
    open class func getViewControllers(withIds: [String], storyboard: String) -> [UIViewController] {
        return withIds.compactMap { (idd) -> UIViewController in
            let storyboard: UIStoryboard = UIStoryboard(name: storyboard, bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: idd)
        }
    }
    
    /// Get instance with identifier
    class open func getInstance(withIdentifier: AAFragmentManagerInstance) -> AAFragmentManager? {
        AAFragmentManager.identifier = withIdentifier._id
        return AAFragmentManager.instance
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromCATransitionSubtype(_ input: CATransitionSubtype) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalCATransitionSubtype(_ input: String?) -> CATransitionSubtype? {
	guard let input = input else { return nil }
	return CATransitionSubtype(rawValue: input)
}
