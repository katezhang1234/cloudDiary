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
            if let hours = Int(newTitle){
                if hours > 8{
                    message.text = "Wow! You slept well last night!"
                }else if hours > 6{
                    message.text = "Are you feeling a bit tired?"
                }else if hours > 4{
                    message.text = "You must be exhausted!"
                }else{
                    message.text = "How are you alive?"
                }
                hoursText.text = ""
            }
        }
    }
    
    
}
