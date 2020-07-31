//
//  Settings.swift
//  cloudDiary
//
//  Created by Kate Zhang on 7/30/20.
//  Copyright © 2020 Kate Zhang. All rights reserved.
//

import UIKit

class Stored{
    static var preferences = Stored(isExpanded: false, isDark: false, notifyOn: false, autoOn: false)
    var isExpanded: Bool
    var isDark: Bool
    var notifyOn: Bool
    var autoOn: Bool
    init(isExpanded: Bool, isDark: Bool, notifyOn: Bool, autoOn: Bool){
        self.isExpanded = isExpanded
        self.isDark = isDark
        self.notifyOn = notifyOn
        self.autoOn = autoOn
    }
}

class Settings: UIViewController {

    @IBOutlet weak var collapseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setExpandProperties()
    }
   
    
    @IBOutlet weak var collapseAppearance: UISwitch!
    
    @IBAction func collapseToggle(_ sender: UISwitch) {
        if Stored.preferences.isExpanded{
            Stored.preferences.isExpanded = false
        }else{
            Stored.preferences.isExpanded = true
        }
        setExpandProperties()
    }
    
    @IBAction func darkModeToggle(_ sender: UISwitch) {
    }
    
    @IBAction func notificationsToggle(_ sender: UISwitch) {
    }
    
    @IBAction func autoGenerateToggle(_ sender: UISwitch) {
    }
    
    func setExpandProperties(){
        if Stored.preferences.isExpanded{
            collapseAppearance.isOn = true
            collapseLabel.text = "Content View: Expanded"
        }else{
            collapseLabel.text = "Content View: Collapsed"
            collapseAppearance.isOn = false
        }
    }
}
