//
//  TrackerViewController.swift
//  cloudDiary
//
//  Created by Sriya Mikki on 7/28/20.
//  Copyright © 2020 Kate Zhang. All rights reserved.
//

import UIKit

class TrackerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var toDos = ["Learn Swift",
                "Do the dishes",
                "Clean bedroom",
                "Read Harry Potter"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return toDos.count
     }


     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
         cell.textLabel?.text = toDos[indexPath.row]
         return cell
     }


}
