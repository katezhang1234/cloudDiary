//
//  SleepTrackerViewController.swift
//  cloudDiary
//
//  Created by Sriya Mikki on 7/30/20.
//  Copyright © 2020 Kate Zhang. All rights reserved.
//

import UIKit

class SleepTrackerViewController: UIViewController {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var hoursText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func enterButtonTapped(_ sender: Any) {
        
        if let newTitle = hoursText.text{
            message.text = "Wow! You slept well last night!"
        }
    }
    
    
    
}
