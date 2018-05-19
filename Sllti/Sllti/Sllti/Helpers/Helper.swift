//
//  Helper.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    //Connects to a given URL by initiating an asynchronous client request.
    func loadRequestFor(webView: UIWebView, forResource: String, ofType: String) {
        webView.loadRequest(URLRequest(url: URL(fileURLWithPath: Bundle.main.path(forResource: forResource, ofType: ofType)!)))
    }
    
    //Attempts to open the resource at the specified URL asynchronously.
    func open(url: String) {
        let url = URL(string: url)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
    
    //Attempts to open itunes at the specified App URL.
    func rate(appId: String) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId) else {
            return
        }
        guard #available(iOS 10, *) else {
            UIApplication.shared.openURL(url)
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
    //The object shares the provided content on Social media platforms and others.
    @objc func share(appURL: String, viewController: UIViewController, textToShare: String, imageToShare: UIImage){
        UIGraphicsBeginImageContext(viewController.view.frame.size)
        viewController.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = imageToShare
        UIGraphicsEndImageContext()
        let text = textToShare
        if let url = URL(string: appURL) {
            let objectsToShare = [text, url, image] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivityType.postToFacebook, UIActivityType.addToReadingList]
            activityVC.popoverPresentationController?.sourceView = viewController.view
            viewController.present(activityVC, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
}
