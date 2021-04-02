//
//  ViewController.swift
//  hustle-cloud-mode
//
//  Created by Artyom Ma  on 02.04.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var CloudHolder: UIView!
    
    @IBOutlet weak var Rocket: UIImageView!
    @IBOutlet weak var ModeLbl: UILabel!
    @IBOutlet weak var OnLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "Acceleration-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func powerButtonPress(_ sender: Any) {
        CloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.0, animations: {
            self.Rocket.frame = CGRect(x: 0, y: 100, width: 414, height: 674)
            
        }) { (finished) in
            self.ModeLbl.isHidden = false
            self.OnLbl.isHidden = false
            
        }
        
    }
    
}

