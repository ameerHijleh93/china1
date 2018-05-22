//
//  SplashViewController.swift
//  Sllti
//
//  Created by ameer on 5/22/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SplashViewController: UIViewController {

    @IBOutlet weak var indicatorView: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView.startAnimating()
        // Do any additional setup after loading the view.
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
