//
//  UIView+SomeThings.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/10/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit

enum RotationDirection {
    case Left
    case Right
}

extension UIView {
    func rotateView(direction : RotationDirection) {
        switch direction {
        case .Left:
            self.layer.setAffineTransform(CGAffineTransformRotate(self.layer.affineTransform(), CGFloat(M_PI_2)))
        case .Right:
            self.layer.setAffineTransform(CGAffineTransformRotate(self.layer.affineTransform(), CGFloat(-M_PI_2)))
        }
        
    }
}

extension UIView {
    // retrieve the properties via the class_copyPropertyList function
    func accessibliseWithVarName () -> Array<String> {
        var results: Array<String> = [];
        
        // retrieve the properties via the class_copyPropertyList function
        var count: UInt32 = 0;
        var myClass: AnyClass = self.classForCoder;
        var properties = class_copyPropertyList(myClass, &count);
        
        // iterate each objc_property_t struct
        for var i: UInt32 = 0; i < count; i++ {
            var property = properties[Int(i)];
            
            // retrieve the property name by calling property_getName function
            var cname = property_getName(property);
            
            // covert the c string into a Swift string
            var name = String.fromCString(cname);
            results.append(name!);
        }
        
        // release objc_property_t structs
        free(properties);
        
        return results;
    }
}