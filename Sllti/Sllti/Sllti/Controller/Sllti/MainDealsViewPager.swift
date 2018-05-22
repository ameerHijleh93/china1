//
//  MainDealsViewPager.swift
//  Sllti
//
//  Created by ameer on 5/21/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

class MainDealsViewPager: UIViewController {

    @IBOutlet weak var viewPager: ViewPager!
  


    // MARK: - var
    private var sliderImagesObj = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSliderImages()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupPager()
    }
    
    private func setupPager() {
        viewPager.dataSource = self
        //viewPager.animationNext()
        viewPager.pageControl.isHidden = true
    }
    
    private func setupSliderImages(){
        sliderImagesObj = ["lion","lion","lion"]
    }
    
}

extension MainDealsViewPager: ViewPagerDataSource{
    
    
    func numberOfItems(viewPager: ViewPager) -> Int {
        return sliderImagesObj.count
    }
    
    func viewAtIndex(viewPager: ViewPager, index: Int, view: UIView?) -> UIView {
        
        //Declaration
        var newView = view
        var imageView = UIImageView()
        
        if (newView == nil) {
            
            //Frames
            newView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:  self.view.frame.height))
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
            
            // Image properites
            // let image = UIImage(named: sliderImagesObj[index])
            // imageView.sd_setImage(with: URL(string: (RealmService.SharedInstans.selectSliderImages().filter {$0.id == sliderImagesObj[index].id}.first?.imgUrl)!) )
            
            imageView.image = UIImage(named: sliderImagesObj[index])
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            
            // Add to view
            newView?.addSubview(imageView)
            
        }
        return newView!
    }
    
}

