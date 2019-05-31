//
//  AAFragmentManager+UIKit.swift
//  AAFragmentManager
//
//  Created by MacBook Pro on 20/09/2018.
//

import UIKit

// MARK: - UIView
extension UIView {

    /// Add subview and for according to height
    ///
    /// - Parameters:
    ///   - subview: Fragment to be added currently in the parent view
    ///   - insets: Insets for current fragment
    func addAndFitSubview(_ subview: UIView, insets: UIEdgeInsets = .zero) {
        addSubview(subview)
        subview.fitInSuperview(with: insets)
    }
    
    /// Fits the given view in its superview
    fileprivate func fitInSuperview(with insets: UIEdgeInsets = .zero) {
        guard let superview = superview else {
            assertionFailure("AAFragmentManager: added fragment was not in a view hierarchy.")
            return
        }
        
        let applyInset: (NSLayoutConstraint.Attribute, UIEdgeInsets) -> CGFloat = {
            switch $0 {
            case .top: return $1.top
            case .bottom: return -$1.bottom
            case .left: return $1.left
            case .right: return -$1.right
            default:
                return 0
            }
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        let attributes = [NSLayoutConstraint.Attribute.top, .left, .right, .bottom]
        superview.addConstraints(attributes.map {
            return NSLayoutConstraint(item: self,
                                      attribute: $0,
                                      relatedBy: .equal,
                                      toItem: superview,
                                      attribute: $0,
                                      multiplier: 1,
                                      constant: applyInset($0, insets))
        })
    }
}


// MARK: - Array Collection
extension Collection {
    
    // Checks if index exists in the given array
    subscript(optional i: Index) -> Iterator.Element? {
        return self.indices.contains(i) ? self[i] : nil
    }
    
}
