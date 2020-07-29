//
//  ViewController.swift
//  cloudDiary
//
//  Created by Kate Zhang on 7/27/20.
//  Copyright © 2020 Kate Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var trackerButton: UIButton!
    @IBOutlet weak var diaryButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackerButton.layer.cornerRadius = 10
        diaryButton.layer.cornerRadius = 10
        settingsButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }


}

