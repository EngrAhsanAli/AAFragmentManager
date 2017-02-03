//
//  AAFragmentManager+Helper.swift
//  AAFragmentManager
//
//  Created by Engr. Ahsan Ali on 03/02/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//



// MARK: - Helper functions
extension AAFragmentManager {
 
    /// Check if view exists in array
    ///
    /// - Parameter index: view index
    /// - Returns: if view exists
    func viewExists(_ index: Int) -> Bool {
        return views?.indices.contains(index) ?? false
    }
    
    /// Empty current view
    func removeSubviews() {
        subviews.forEach({$0.removeFromSuperview()})
    }
    
    /// Get specific fragment by index
    ///
    /// - Parameter index: fragment index
    /// - Returns: fragment view controller
    open func getFragment(_ index: Int) -> UIViewController? {
        if viewExists(index) {
            return views![index]
        }
        return nil
    }
    
}



