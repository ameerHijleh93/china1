//
//  View+Util.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//


import UIKit

extension UIView {
    func makeCircular() {
        let side = min(bounds.size.width, bounds.size.height)
        layer.cornerRadius = side/2
    }
    
    func addCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        layer.masksToBounds = false
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func copyView() -> UIView? {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as? UIView
    }
    
    func animate(borderColor: UIColor) {
        let colorAnimation = CABasicAnimation(keyPath: "borderColor")
        colorAnimation.fromValue = layer.borderColor
        colorAnimation.toValue = borderColor.cgColor
        colorAnimation.duration = 0.2
        colorAnimation.isRemovedOnCompletion = false
        colorAnimation.fillMode = kCAFillModeForwards
        layer.add(colorAnimation, forKey: "borderColor")
    }
}
