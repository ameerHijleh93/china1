//
//  AbuHamdanLlAthathViewController.swift
//  Sllti
//
//  Created by ameer on 5/22/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

class AbuHamdanLlAthathViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        tap.delegate = self
        myView.addGestureRecognizer(tap)
    }
    
@objc func handleTap(sender: UITapGestureRecognizer? = nil) {
    myView.isHidden = true
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
