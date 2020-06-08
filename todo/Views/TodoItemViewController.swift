//
//  TodoItemViewController.swift
//  todo
//
//  Created by Ehidiamen Ojielu on 6/7/20.
//  Copyright © 2020 ehis. All rights reserved.
//

import UIKit

class TodoItemViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var todoItemTextField: UITextField!
    @IBOutlet weak var priorityControl: PriorityControl!
    
    weak var delegate: TodoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func handleDone(_ sender: Any) {
        if let text = todoItemTextField.text {
            delegate?.addTodo(TodoItem(title: text, createdAt: Date(), modifiedAt: Date(), priority: priorityControl.priority))
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func handleCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
