//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController , AVAudioPlayerDelegate {
        var audioPlayer : AVAudioPlayer!
        var ta = 1
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
        }


    @IBAction func notePressed(_ sender: UIButton) {
        
                ta = sender.tag
        
                playSound()
        
        
    }
        func playSound(){
            //  var a = notePressed.sender.tag
            let soundUrl = Bundle.main.url(forResource: "note\(ta)", withExtension: "wav")
    
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
            }
            catch{
                print(error)
            }
            audioPlayer.play()
        }
  

}

//import UIKit
//import AVFoundation  // aoudio vigin foundation
//
//class ViewController: UIViewController , AVAudioPlayerDelegate {
//
//    var audioPlayer : AVAudioPlayer!
//    var ta = 1
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//
//
//    @IBAction func notePressed(_ sender: UIButton) {
//        //  var a = sender.tag
//
//        //        if let soundURL = Bundle.main.url(forResource: "note4", withExtension: "wav") {
//        //            var mySound: SystemSoundID = 0
//        //            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//        //            // Play
//        //            AudioServicesPlaySystemSound(mySound);
//        //        }
//
//        ta = sender.tag
//
//        playSound()
//
//    }
//
//
//    //    @IBAction func notePressed(_ sender: UIButton) {
//    //        var a = sender.tag
//    //        let soundUrl = Bundle.main.url(forResource: "note\(a)", withExtension: "wav")
//    //
//    //        try! audioPlayer = AVAudioPlayer(contentsOf: soundUrl!)
//    //
//    //        //        if let soundURL = Bundle.main.url(forResource: "note4", withExtension: "wav") {
//    //        //            var mySound: SystemSoundID = 0
//    //        //            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//    //        //            // Play
//    //        //            AudioServicesPlaySystemSound(mySound);
//    //        //        }
//    //
//    //        audioPlayer.play()
//    //    }
//    //
//
//    func playSound(){
//        //  var a = notePressed.sender.tag
//        let soundUrl = Bundle.main.url(forResource: "note\(ta)", withExtension: "wav")
//
//        do{
//            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
//        }
//        catch{
//            print(error)
//        }
//        audioPlayer.play()
//    }
//
//
//
//}
//
