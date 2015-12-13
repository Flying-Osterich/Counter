//
//  UIView+RotateOrientation.swift
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