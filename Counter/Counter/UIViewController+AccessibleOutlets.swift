//
//  UIViewController+AccessibleOutlets.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/13/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit

extension UIViewController {
    func accessibliseWithVarName () -> Array<String> {
        var results: Array<String> = [];
        
        var count: UInt32 = 0;
        let properties = class_copyPropertyList(self.classForCoder, &count);
        for var i: UInt32 = 0; i < count; i++ {
            let cname = property_getName(properties[Int(i)]);
            let name = String.fromCString(cname);
            results.append(name!);
        }
        free(properties);
        
        return results;
    }
}