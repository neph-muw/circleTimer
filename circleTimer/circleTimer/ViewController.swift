//
//  ViewController.swift
//  circleTimer
//
//  Created by Roman Mykitchak on 03/08/2018.
//  Copyright © 2018 Roman Mykitchak. All rights reserved.
//https://recruitment.app.daftmobile.com/4bfa8ed19efc45a6a4c162492a40a44e/task.html

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var circleView: UICircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        circleView.setNeedsDisplay()
        circleView.setNeedsDisplay(circleView.frame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func runPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            sender.setTitle("Stop", for: .normal)
        } else {
            sender.tag = 0
            sender.setTitle("Start", for: .normal)
        }
        
        self.circleView.run(tagi: sender.tag)
        
    }
    
}

