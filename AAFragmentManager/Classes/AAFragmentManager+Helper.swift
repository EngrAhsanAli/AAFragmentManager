//
//  AAFragmentManager+Helper.swift
//  AAFragmentManager
//
//  Created by Engr. Ahsan Ali on 03/02/2017.
//  Copyright (c) 2017 AA-Creations. All rights reserved.
//

public typealias AAFragment = AA_Fragment<String, String>
public typealias AAFragmentManagerInstance = AA_FragmentManagerInstance<String>

// MARK:- AAFragmentParent
open class AA_FragmentManagerInstance<S>: AAFragmentManager {
    public let _id: String
    
    public init(_ identifier: String) {
        self._id = identifier
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK:- AAFragment
open class AA_Fragment<V, S>: AAFragmentManager {
    open var viewsController: UIViewController
    
    public init(_ withId: String, storyboard: String) {

        self.viewsController =
            UIStoryboard(name: storyboard, bundle: nil)
            .instantiateViewController(withIdentifier: withId)
        
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
