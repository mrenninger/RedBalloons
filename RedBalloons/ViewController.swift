//
//  ViewController.swift
//  RedBalloons
//
//  Created by Michael Renninger on 11/24/14.
//  Copyright (c) 2014 Michael Renninger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    var images = ["RedBalloon1.jpg","RedBalloon2.jpg","RedBalloon3.jpg","RedBalloon4.jpg"]
    var curBalloonNum = 0;
    var curRandomNum = 0;

    var balloons:[Balloon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for var i = 0; i < 99; i++ {
            var tBalloon = Balloon()
            tBalloon.num = i + 1
            
            var randNum:Int
            do {
                randNum = Int(arc4random_uniform(UInt32(images.count)))
            } while curRandomNum == randNum
            
            curRandomNum = randNum
            tBalloon.img = UIImage(named:images[randNum])
            
            
            balloons.append(tBalloon)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onNextBtnPressed(sender: UIBarButtonItem) {
        self.img.image = balloons[curBalloonNum].img
        self.lbl.text = "Balloon \(balloons[curBalloonNum].num)"
        
        curBalloonNum++
        
        if curBalloonNum == 99 {
            curBalloonNum = 0
        }
    }

}

