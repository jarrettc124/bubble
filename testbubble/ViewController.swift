//
//  ViewController.swift
//  testbubble
//
//  Created by Jarrett Chen on 5/2/16.
//  Copyright © 2016 playground. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bubble:BubbleLayoutView = BubbleLayoutView(frame: CGRectMake(0,60,100,100))
        self.view .addSubview(bubble)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

