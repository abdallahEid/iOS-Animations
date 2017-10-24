//
//  ViewController.swift
//  Animation
//
//  Created by Abdallah Eid on 10/24/17.
//  Copyright © 2017 TripleApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number = 1
    var isAnimating = false
    var timer = Timer()
    
    func animate() {
        
        image.image = UIImage(named: "\(number).gif")
        
        number += 1
        
        if number == 8 {
            
            number = 1
            
        }
        
    }

    @IBOutlet var buttonTitle: UIButton!
    
    @IBOutlet var image: UIImageView!
    
    @IBAction func slideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2, animations: {
            
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
            
        })
        
    }
    
    @IBAction func fadeIn(_ sender: Any) {
        
        image.alpha = 0
        
        UIView.animate(withDuration: 2, animations: {
            
            self.image.alpha = 1
            
        })
        
    }
    
    @IBAction func grow(_ sender: Any) {
    
        image.frame = CGRect(x: image.frame.origin.x , y: image.frame.origin.y , width:0 , height:0)
        
        UIView.animate(withDuration: 2, animations: {
            
            self.image.frame = CGRect(x: self.image.frame.origin.x , y: self.image.frame.origin.y, width: 375, height: 247)
            
        })
        
    }
    @IBAction func start(_ sender: Any) {
        
        if isAnimating {
            
            timer.invalidate()
            
            buttonTitle.setTitle("Start Animating", for: [])
            
            isAnimating = false
            
        } else {
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            buttonTitle.setTitle("Stop Animating", for: [])
            
            isAnimating = true
            
        }
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

