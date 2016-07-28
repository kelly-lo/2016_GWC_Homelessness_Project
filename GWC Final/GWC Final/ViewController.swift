//
//  ViewController.swift
//  GWC Final
//
//  Created by Facebook on 7/26/16.
//  Copyright © 2016 Katie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.playRoundButton.setTitle("Play",forState:UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playRoundTapped(sender: UIButton) {
        self.playRoundButton.setTitle("Play Round", forState: UIControlState.Normal)
        
    }

}

