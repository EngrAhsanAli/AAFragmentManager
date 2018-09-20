//
//  AAFragmentManager+AssociatedObjects.swift
//  AAFragmentManager
//
//  Created by MacBook Pro on 20/09/2018.
//

import ObjectiveC



extension AAFragmentManager {
    /// Associated objects in objective C
    private class AssociatedObject {
        var _obj: Any?
        
        var obj: Any? {
            return _obj
        }
        
        init(_ obj: Any?) {
            _obj = obj
        }
        
    }
    class func getInstance<T>(key: String) -> T? {
        return (objc_getAssociatedObject(self, key.address) as? AssociatedObject)?.obj as? T
    }
    
    class func setInstance<T>(obj: T?, key: String) {
        objc_setAssociatedObject(self, key.address, AssociatedObject(obj), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

// MARK: - String
extension String {
    
    fileprivate var address: UnsafeRawPointer {
        return UnsafeRawPointer(bitPattern: abs(hashValue))!
    }
    
}
