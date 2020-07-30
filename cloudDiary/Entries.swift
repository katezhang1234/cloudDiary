//
//  Entries.swift
//  cloudDiary
//
//  Created by Kate Zhang on 7/29/20.
//  Copyright © 2020 Kate Zhang. All rights reserved.
//

import UIKit

//mini class that's a blueprint for a lot of objects
//only properties, no actions (functions)
struct Entry {
    var title : String
    var description : String
}

class Entries: UITableViewController {

    var allEntries = [Entry(title: "July 27", description: "Worked on wire frame"),
    Entry(title: "July 28", description: "Went to the park"), Entry(title: "July 29", description: "Koded for a few hours")
    ]
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEntries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = allEntries[indexPath.row].title
        cell.detailTextLabel?.text = allEntries[indexPath.row].description
        return cell
    }

   override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
          return nil
          //get rid of annoying "Prototype Cells" header
      }

}
