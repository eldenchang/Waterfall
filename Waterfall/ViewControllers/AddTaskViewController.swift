//
//  AddTaskViewController.swift
//  Waterfall
//
//  Created by Qifan Chang on 10/20/18.
//  Copyright © 2018 boilermake6. All rights reserved.

import UIKit

class AddTaskViewController: UIViewController {
   
   @IBOutlet weak var taskText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        
    }
   
    @IBAction func CloseAddTask(_ sender: Any) {
      //self.view.removeFromSuperview()
      self.removeAnimate()
    }
    
   @IBAction func SaveAddTask(_ sender: Any) {
      self.storeNewTask()
      self.removeAnimate()
   }
   
   func storeNewTask(){
      let new_task = Task(TaskText: taskText.text!, dueDate: NSDate())
   }
   
   
   func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
