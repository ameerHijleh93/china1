//
//  View+Shadow.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

extension UIView {
    private func addShadow(opacity: Float, radius: CGFloat, color: UIColor, offset: CGSize) {
        layer.masksToBounds = false
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func addButtonShadow() {
        addShadow(opacity: 1.0,
                  radius: 8.0,
                  color: UIColor.greyishBlue46,
                  offset: CGSize(width: 0, height: 6))
    }
    
    
    func addMenuButtonShadowWith(color: UIColor) {
        addShadow(opacity: 1.0,
                  radius: 0.0,
                  color: color,
                  offset: CGSize(width: 0, height: 3.0))
    }
    
    func removeMenuButtonShadow() {
        //        layer.backgroundColor = UIColor.nocFiltersButtonsGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.clear.cgColor
    }
    
    
    func testShadow() {
        addShadow(opacity: 0.5,
                  radius: 10.0,
                  color: UIColor.lightGray,
                  offset: CGSize(width: 0, height: 2.0))
    }
    
}
