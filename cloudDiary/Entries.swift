//
//  Entries.swift
//  cloudDiary
//
//  Created by Kate Zhang on 7/29/20.
//  Copyright © 2020 Kate Zhang. All rights reserved.
//

import UIKit

class Selected{
    static var current = Selected(index: -1)
    var index: Int
    init(index: Int){
        self.index = index
    }
}

class Entries: UITableViewController {

    var allEntries: [EntryCD] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setInterface()
    }
    
    override func viewWillAppear(_ animated: Bool){
        getEntries()
        setInterface()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEntries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = allEntries[indexPath.row].title
        cell.detailTextLabel?.text = allEntries[indexPath.row].subtitle

        if Stored.preferences.isExpanded{
            cell.detailTextLabel?.numberOfLines = 0
            tableView.rowHeight = UITableView.automaticDimension
        }else{
            cell.detailTextLabel?.numberOfLines = 1
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //get rid of "Prototype Cells" Header
        return nil
    }
    
    
    @IBAction func addButtonClicked(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let entry = EntryCD(entity: EntryCD.entity(), insertInto: context)
            entry.title = ""
            entry.subtitle = ""
            try? context.save()
            getEntries()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            Selected.current.index = indexPath.row
        }
        
        func getEntries(){
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                if let coreDataEntries = try? context.fetch(EntryCD.fetchRequest()) as? [EntryCD]{
                    allEntries = coreDataEntries
                    tableView.reloadData()
                }
            }
        }
        
       override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           return true
       }

       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if (editingStyle == .delete) {
               if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                   context.delete(allEntries[indexPath.row])
                   try? context.save()
                   getEntries()
               }
           }
       }
        func setInterface(){
            if Stored.preferences.isDark{
                overrideUserInterfaceStyle = .dark
            }else{
                overrideUserInterfaceStyle = .light
            }
        }
}

