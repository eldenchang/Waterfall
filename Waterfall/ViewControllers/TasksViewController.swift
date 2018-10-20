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
//   let t1 = Task(TaskText: "Eggs", dueDate: NSDate())
//   let t2 = Task(TaskText: "Pizza", dueDate: NSDate())
    var tasks : [Task] = [Task(TaskText: "Eggs", dueDate: NSDate())] // Example tasks
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        let task = tasks[indexPath.row]
        var taskFontSize = 20.0; // var for font size of the task text
        cell.taskLabel.text = task.TaskText;
        cell.taskLabel.font = UIFont(name:"AppleSDGothicNeo-Medium", size: CGFloat(taskFontSize));
        return cell;
    }
    
    @IBAction func showAddTask(_ sender: AnyObject) {
        let addTaskVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddTaskWindow") as! AddTaskViewController
        // addTaskVC.previousVC = self
        self.addChild(addTaskVC)
        addTaskVC.view.frame = self.view.frame
        self.view.addSubview(addTaskVC.view)
        addTaskVC.didMove(toParent: self)
    }
    
    
 

}
