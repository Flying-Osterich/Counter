//
//  UIViewController+AccessibleOutlets.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/13/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit

extension objc_property_t {
    var name : String { get { return String.fromCString(property_getName(self))! }}
    
    func isType(type: String) -> Bool {
        let attributes = String.fromCString(property_getAttributes(self))!
        return attributes.containsString("T@\"\(type)")
    }
}

extension UIViewController {
    func accessibliseWithVarName () -> Array<String> {

        func propertyList () -> Array<objc_property_t> {
            var results: Array<objc_property_t> = []
            
            var count: UInt32 = 0
            let properties = class_copyPropertyList(self.classForCoder, &count)
            for var i: UInt32 = 0; i < count; i++ {
                let property = properties[Int(i)]
                results.append(property)
            }
            free(properties);
            
            return results
        }
        
        propertyList().forEach { (property) -> () in
            if property.isType("UIButton") {
                let objectsClass : AnyClass = object_getClass(self);
                let ivarName = property_copyAttributeValue(property, "V")
                let ivar = class_getInstanceVariable(objectsClass, ivarName );
                let value = object_getIvar(self, ivar)
                let castedValue : UIButton! = value as! UIButton!
                castedValue.accessibilityIdentifier = property.name
           }
        }
        
        return propertyList().map({ (property) -> String in
            return property.name
        })
    }
}