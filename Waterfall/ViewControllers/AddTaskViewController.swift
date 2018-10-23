//
//  AddTaskViewController.swift
//  Waterfall
//
//  Created by Qifan Chang on 10/20/18.
//  Copyright © 2018 boilermake6. All rights reserved.

import UIKit

protocol addTaskDelegate {
    func didTapAdd()
}

class AddTaskViewController: UIViewController, UITextViewDelegate {
    
    //adding delegate for adding task
    var addingDelegate : addTaskDelegate!
    
    //@IBOutlet weak var taskText: UITextField!
    @IBOutlet weak var gettext: UITextView!
    @IBOutlet weak var popUpWindow: UIView!
    @IBOutlet var screenView: UIView!
    
    
    var popUpWindowButtomConstraint : NSLayoutConstraint?
    //@IBOutlet weak var getTaskText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        gettext.delegate = self
        gettext.isEditable = true
        gettext.text = "Add new task"
        gettext.textColor = UIColor.lightGray
        
        //Listener of when will the keyboard show up
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        popUpWindowButtomConstraint = NSLayoutConstraint(item: popUpWindow, attribute: .bottom, relatedBy: .equal, toItem: screenView, attribute: .bottom, multiplier: 1, constant: -(self.view.frame.size.height - 196) / 2)
        screenView.addConstraint(popUpWindowButtomConstraint!)
        
    }
    
    @objc func handleKeyboardNotification(notification: NSNotification){
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
            popUpWindowButtomConstraint?.constant = -keyboardFrame!.height
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if gettext.textColor == UIColor.lightGray {
            gettext.text = nil
            gettext.textColor = UIColor.black
        }
        self.gettext.becomeFirstResponder()
    }
    
    @IBAction func CloseAddTask(_ sender: Any) {
        //self.view.removeFromSuperview()
        self.removeAnimate()
    }
    
    @IBAction func SaveAddTask(_ sender: Any) {
        self.storeNewTask()
        self.removeAnimate()
        addingDelegate.didTapAdd()
    }
    
    func storeNewTask(){
        let new_task = Task(TaskText: gettext.text!, Importance: 2)!
        tasks.append(new_task)
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
