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
    var toDos : [ToDo] = []
    override func viewDidLoad() {
        
        super.viewDidLoad()
        toDos = createToDos()
        // Do any additional setup after loading the view.
    }
    

   func createToDos() -> [ToDo]{
         let swift = ToDo()
         swift.name = "Learn Swift"
         
         let dog = ToDo()
         dog.name = "Do the dishes"
         
         return [swift, dog]
     }
     
    
    

     // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int{
         return 1
     }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return toDos.count
     }


     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
         let toDo = toDos[indexPath.row]
         cell.textLabel?.text = toDo.name

         return cell
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         
         let toDo = toDos[indexPath.row]
         
     }



     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let addVC = segue.destination as?
         AddToDoViewController {
             addVC.previousVC = self
         }
         
     }
 


}
