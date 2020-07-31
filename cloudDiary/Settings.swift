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
        setInterface()
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
    
    @IBOutlet weak var darkToggleAppearance: UISwitch!
    
    @IBAction func darkModeToggle(_ sender: UISwitch) {
        if Stored.preferences.isDark{
            Stored.preferences.isDark = false
        }else{
            Stored.preferences.isDark = true
        }
        setInterface()
    }
    
    @IBAction func notificationsToggle(_ sender: UISwitch) {
    }
    
    @IBOutlet weak var autoGenerateAppearance: UISwitch!
    
    @IBAction func autoGenerateToggle(_ sender: UISwitch) {
        if Stored.preferences.autoOn{
                   Stored.preferences.autoOn = false
               }else{
                   Stored.preferences.autoOn = true
               }
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
    
    func setInterface(){
        if Stored.preferences.isDark{
            overrideUserInterfaceStyle = .dark
            darkToggleAppearance.isOn = true
        }else{
            overrideUserInterfaceStyle = .light
            darkToggleAppearance.isOn = false
        }
    }
    
    func autoSettings(){
        if Stored.preferences.autoOn{
            autoGenerateAppearance.isOn = true
        }else{
            autoGenerateAppearance.isOn = false
        }
    }
}
