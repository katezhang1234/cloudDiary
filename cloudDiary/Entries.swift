//
//  Entries.swift
//  cloudDiary
//
//  Created by Kate Zhang on 7/29/20.
//  Copyright © 2020 Kate Zhang. All rights reserved.
//

import UIKit
import Foundation

class Selected{
    static var current = Selected(index: -1)
    var index: Int
    init(index: Int){
        self.index = index
    }
}

class Entries: UITableViewController {

    var allEntries: [EntryCD] = []
    
    override func viewWillAppear(_ animated: Bool){
        getEntries()
        setInterface()
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        getEntries()
        setInterface()
        
        if Stored.preferences.autoOn{
            generateEntries()
        }
    }
    
    func runCode() {
        let UserCalendar = Calendar.current
        let now = Date()
        let nowComponents = UserCalendar.dateComponents([.year, .month, .day], from: now)
        var month = ""
        if nowComponents.month == 1{
            month = "January"
        }else if nowComponents.month == 2{
            month = "February"
        }else if nowComponents.month == 3{
            month = "March"
        }else if nowComponents.month == 4{
            month = "April"
        }else if nowComponents.month == 5{
            month = "May"
        }else if nowComponents.month == 6{
            month = "June"
        }else if nowComponents.month == 7{
            month = "July"
        }else if nowComponents.month == 8{
            month = "August"
        }else if nowComponents.month == 9{
            month = "September"
        }else if nowComponents.month == 10{
            month = "October"
        }else if nowComponents.month == 11{
            month = "November"
        }else if nowComponents.month == 12{
            month = "December"
        }
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let entry = EntryCD(entity: EntryCD.entity(), insertInto: context)
            entry.title = "\(month) \(nowComponents.day!), \(nowComponents.year!)"
            entry.subtitle = " "
            try? context.save()
            getEntries()
        }
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
            cell.textLabel?.numberOfLines = 0
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
        if Stored.preferences.autoOn{
            runCode()
        }else{
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                let entry = EntryCD(entity: EntryCD.entity(), insertInto: context)
                entry.title = ""
                entry.subtitle = ""
                try? context.save()
                getEntries()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        Selected.current.index = allEntries.count - indexPath.row - 1
    }
       
    
        func getEntries(){
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                if let coreDataEntries = try? context.fetch(EntryCD.fetchRequest()) as? [EntryCD]{
                    allEntries = coreDataEntries
                    
                    //so that new entries will appear on the top
                    allEntries.reverse()
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
    
    
    func generateEntries(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let previous = try? context.fetch(DateCD.fetchRequest()) as? DateCD{
                let previousCalendar = Calendar.current
                var previousComponents = previousCalendar.dateComponents([.year, .month, .day, .hour, .minute], from: previous.previousDate!)
                let userCalendar = Calendar.current
                let nowDate = Date()
                let nowDateComponents = userCalendar.dateComponents([.year, .month, .day, .hour, .minute], from: nowDate)
                if nowDateComponents.year != previousComponents.year || nowDateComponents.month != previousComponents.month || nowDateComponents.day != previousComponents.day{
                    runCode()
                    print("Entry was generated")
                    previous.previousDate = nowDate
                    previousComponents = nowDateComponents
                }
            }
        }
    }
}

