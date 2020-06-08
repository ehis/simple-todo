//
//  ViewController.swift
//  todo
//
//  Created by Ehidiamen Ojielu on 6/5/20.
//  Copyright © 2020 ehis. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol TodoViewControllerDelegate : class {
    func addTodo(_ todoItem: TodoItem)
}

class TodoViewController: UIViewController, UITableViewDelegate, TodoViewControllerDelegate {
    
    @IBOutlet weak var todoTableView: UITableView!
    
    let disposeBag = DisposeBag()
    let todoViewModel = TodoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Todos"
        todoViewModel.todos.bind(to: todoTableView.rx.items(cellIdentifier: "TodoViewCell", cellType: UITableViewCell.self)) {
            (row, element, cell)
            in cell.textLabel?.text = "\(element.title)"
            switch element.priority {
                case .low:
                cell.textLabel?.textColor = UIColor.green
                case .medium:
                cell.textLabel?.textColor = UIColor.orange
                case .high:
                cell.textLabel?.textColor = UIColor.red
            }
        }
        .disposed(by: disposeBag)
        
        
    }
    
    func addTodo(_ todoItem: TodoItem) {
        todoViewModel.insert(todoItem)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let target = segue.destination as? TodoItemViewController {
            target.delegate = self
        }
    }
    
}
