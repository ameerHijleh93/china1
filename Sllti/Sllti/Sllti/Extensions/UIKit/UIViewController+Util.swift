//
//  UIViewController+Util.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func showHome(vc: UIViewController) {
        let sb = UIStoryboard(name: "SideMenu", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "SWRevealViewController")
        vc.navigationController?.present(controller, animated: false)
    }
    
    func alertWith(title: String, message: String, controller: UIViewController, actionTitle: String, actionStyle: UIAlertActionStyle, withCancelAction: Bool, completion: @escaping () -> Void) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: actionStyle, handler: { (action) in
            completion()
        }))
        alert.view.tintColor = UIColor.primaryColor
        //        if withCancelAction {
        //            alert.addAction(title: "Cancel", color: UIColor.gray, style: .cancel,  handler: nil)
        //
        //        }
        
        controller.present(alert, animated: true, completion: nil)
    }
    
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func backTo(){
        let backButton: UIBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(back))
        backButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backButton
        
    }
    //    func alertWithLogin(vc: UIViewController, isFromSideMenu: Bool) {
    //        let alert = UIAlertController.init(title: "", message: "Please login to continue", preferredStyle: .alert)
    //        alert.view.tintColor = UIColor.primaryColor
    //
    //        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in
    //            let sb = UIStoryboard(name: "Auth", bundle: nil)
    //            let controller = sb.instantiateViewController(withIdentifier: "Login")
    //            vc.revealViewController().setFront(controller, animated: true)
    //            if isFromSideMenu {
    ////                if SharedData.SharedInstans.getLanguage() == "ar" && L102Language.currentAppleLanguage() == "ar" {
    ////                    vc.revealViewController().rightRevealToggle(animated: true)
    ////                } else {
    //                    vc.revealViewController().revealToggle(animated: true)
    ////                }
    //            }
    //        }))
    //
    //        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    //        vc.present(alert, animated: true, completion: nil)
    //    }
    
    
    
}
