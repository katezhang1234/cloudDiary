//
//  HabitTrackerViewController.swift
//  cloudDiary
//
//  Created by Sriya Mikki on 7/29/20.
//  Copyright © 2020 Kate Zhang. All rights reserved.
//

import UIKit

class HabitTrackerViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func button1change(_ sender: Any) {
        self.button1.backgroundColor = UIColor.systemGray5
    }
    @IBAction func button2change(_ sender: Any) {
        self.button2.backgroundColor = UIColor.systemGray5
    }
    
    @IBAction func button3change(_ sender: Any) {
        self.button3.backgroundColor = UIColor.systemGray5
    }
    @IBAction func button4change(_ sender: Any) {
        self.button4.backgroundColor = UIColor.systemGray5
    }
    @IBAction func button5change(_ sender: Any) {
        self.button5.backgroundColor = UIColor.systemGray5
    }
    
    
    
    
    
}

