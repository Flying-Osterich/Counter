//
//  UIViewController+AccessibleOutlets.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/13/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit

extension UIViewController {
    // retrieve the properties via the class_copyPropertyList function
    func accessibliseWithVarName () -> Array<String> {
        var results: Array<String> = [];
        
        // retrieve the properties via the class_copyPropertyList function
        var count: UInt32 = 0;
        let myClass: AnyClass = self.classForCoder;
        let properties = class_copyPropertyList(myClass, &count);
        
        // iterate each objc_property_t struct
        for var i: UInt32 = 0; i < count; i++ {
            let property = properties[Int(i)];
            
            // retrieve the property name by calling property_getName function
            let cname = property_getName(property);
            
            // covert the c string into a Swift string
            let name = String.fromCString(cname);
            results.append(name!);
        }
        
        // release objc_property_t structs
        free(properties);
        
        return results;
    }
}
