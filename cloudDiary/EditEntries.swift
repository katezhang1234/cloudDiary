//
//  EditEntries.swift
//  cloudDiary
//
//  Created by Kate Zhang on 7/30/20.
//  Copyright © 2020 Kate Zhang. All rights reserved.
//

import UIKit

class EditEntries: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let coreDataEntries = try? context.fetch(EntryCD.fetchRequest()) as? [EntryCD]{
                let editIndex = Selected.current.index
                editTitle.text = coreDataEntries[editIndex].title
                editSubtitle.text = coreDataEntries[editIndex].subtitle
            }
        }
        
        setInterface()
    }
    
    @IBOutlet weak var editTitle: UITextView!
    
    @IBOutlet weak var editSubtitle: UITextView!
    
    @IBAction func saveButton(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let coreDataEntries = try? context.fetch(EntryCD.fetchRequest()) as? [EntryCD]{
                coreDataEntries[Selected.current.index].title = editTitle.text
                
                coreDataEntries[Selected.current.index].subtitle = editSubtitle.text
                try? context.save()
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func setInterface(){
        if Stored.preferences.isDark{
            overrideUserInterfaceStyle = .dark
            editTitle.textColor = UIColor.white
            editSubtitle.textColor = UIColor.white
        }else{
            overrideUserInterfaceStyle = .light
            editTitle.textColor = UIColor.black
            editSubtitle.textColor = UIColor.black
        }
    }
}
