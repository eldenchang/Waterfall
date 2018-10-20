//
//  TasksViewController.swift
//  Waterfall
//
//  Created by Dhriti Chawla on 10/19/18.
//  Copyright © 2018 boilermake6. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    var tasks = ["Do Laundry", "Pick up fruits", "Study for exam"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        let task = tasks[indexPath.row]
        
        cell.taskLabel.text = task;
        return cell;
    }
    
    
 

}
