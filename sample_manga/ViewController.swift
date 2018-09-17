//
//  ViewController.swift
//  sample_manga
//
//  Created by staff on 2018/09/17.
//  Copyright © 2018年 staff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageArray = [UIImage]()
    var timer1 = Timer()
    var timer2 = Timer()
    var count = 0
    var updateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image0 = UIImage(named: "dash0")
        let image1 = UIImage(named: "dash1")
        let image2 = UIImage(named: "dash2")
        let image3 = UIImage(named: "dash3")
        let image4 = UIImage(named: "dash4")
        let image5 = UIImage(named: "dash5")
        
        imageArray = [image0!, image1!, image2!, image3!,image4!, image5!]
    }
    
    @IBAction func runButton(_ sender: UIButton) {
        // Timer START
        // imageViewに1秒ごとに画像を表示させる
        
        timer1 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.count += 1
            self.countLabel.text = String(self.count)
        })
        
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
            if self.updateCount > 5 {
                self.updateCount = 0
                self.imageView.image = UIImage(named: "dash0")
            } else {
                self.imageView.image = self.imageArray[self.updateCount]
            }
            
            self.updateCount += 1
        })
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        // Timer RESET
        
        timer1.invalidate()
        timer2.invalidate()
    }
}

