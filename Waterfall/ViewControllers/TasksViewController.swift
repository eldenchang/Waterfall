//
//  TasksViewController.swift
//  Waterfall
//
//  Created by Dhriti Chawla on 10/19/18.
//  Copyright © 2018 boilermake6. All rights reserved.
//
import UIKit

var tasks: [Task] = []

class TasksViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var tableView: UITableView!
    //var taskFontSize = 20.0; // var for font size of the task text
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 50
//        tableView.UTTableViewStyle = UITableViewStylePlain
        //      NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        
        tasks.append(Task(TaskText: "Code code code", Importance: 8)!)
        tasks.append(Task(TaskText: "Call Varun", Importance: 2)!)
        tasks.append(Task(TaskText: "Thanksgiving Plan", Importance: 5)!)
        tasks.append(Task(TaskText: "ECE477 report", Importance: 7)!)
        tasks.append(Task(TaskText: "CSR342 Quiz", Importance: 3)!)
        tasks.append(Task(TaskText: "ECE400 bonus", Importance: 3)!)
        tasks.append(Task(TaskText: "Book hotel", Importance: 4)!)
        tasks.append(Task(TaskText: "Study for code interview", Importance: 8)!)
        tasks.append(Task(TaskText: "Checkout Webapi", Importance: 3)!)
        tasks.append(Task(TaskText: "Check Tire pressure", Importance: 1)!)
                
        // Do any additional setup after loading the view.
    }
    
    
//    @IBOutlet weak var navBar: tableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        let task = tasks[indexPath.row]
        cell.taskLabel.text = task.TaskText;
        cell.taskLabel.font = UIFont(name:"AppleSDGothicNeo-Medium", size: CGFloat(fontSizeForIndex(index: indexPath.row)));
        //self.myTableView.separatorColor = [UIColor clearColor];
        //self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    }
    
    // MARK: - Table view delegate
    
    @IBAction func showAddTask(_ sender: AnyObject) {
        let addTaskVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddTaskWindow") as! AddTaskViewController
        self.addChild(addTaskVC)
        addTaskVC.addingDelegate = self
        addTaskVC.view.frame = self.view.frame
        self.view.addSubview(addTaskVC.view)
        addTaskVC.didMove(toParent: self)
    }
    
    //Helper functions
    func fontSizeForIndex(index: Int) -> CGFloat {
        let itemCount = tasks.count - 1
        let val = (CGFloat(tasks[index].Importance!) / CGFloat(itemCount)) * 0.6
        return val * 15 + 10
    }
    
}

extension TasksViewController : addTaskDelegate{
    func didTapAdd() {
        tableView.reloadData()
    }
}
