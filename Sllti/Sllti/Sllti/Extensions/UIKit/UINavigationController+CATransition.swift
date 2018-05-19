//
//  UINavigationController+CATransition.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

extension UINavigationController {
    func pushFromBottom(controller: UIViewController) {
        let presentAnimation = CATransition()
        presentAnimation.duration = 0.35
        presentAnimation.type = kCATransitionMoveIn
        presentAnimation.subtype = kCATransitionFromTop
        presentAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        view.layer.add(presentAnimation, forKey: "presentation")
        pushViewController(controller, animated: false)
    }
}
