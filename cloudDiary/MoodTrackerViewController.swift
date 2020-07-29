//
//  MoodTrackerViewController.swift
//  cloudDiary
//
//  Created by Sriya Mikki on 7/29/20.
//  Copyright © 2020 Kate Zhang. All rights reserved.
//

import UIKit

class MoodTrackerViewController: UIViewController {

    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var excitedButton: UIButton!
    @IBOutlet weak var curiousButton: UIButton!
    @IBOutlet weak var lazyButton: UIButton!
    @IBOutlet weak var tiredButton: UIButton!
    @IBOutlet weak var lonelyButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var boredButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func happyTapped(_ sender: Any) {
        self.happyButton.backgroundColor = UIColor.red
    }
    
    @IBAction func excitedTapped(_ sender: Any) {
          self.excitedButton.backgroundColor = UIColor.orange
    }
    
    @IBAction func curiousTapped(_ sender: Any) {
         self.curiousButton.backgroundColor = UIColor.yellow
    }
    
    @IBAction func lazyTapped(_ sender: Any) {
        self.lazyButton.backgroundColor = UIColor.green
    }
    
    @IBAction func tiredTapped(_ sender: Any) {
         self.tiredButton.backgroundColor = UIColor.blue
    }
    
    @IBAction func lonelyTappen(_ sender: Any) {
        self.lonelyButton.backgroundColor = UIColor.purple
    }
    
    @IBAction func sadTapped(_ sender: Any) {
        self.sadButton.backgroundColor = UIColor.gray
    }
    
    @IBAction func boredTapped(_ sender: Any) {
        self.boredButton.backgroundColor = UIColor.white
    }
    
    
}
