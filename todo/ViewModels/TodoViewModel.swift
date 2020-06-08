//
//  TodoViewModel.swift
//  todo
//
//  Created by Ehidiamen Ojielu on 6/5/20.
//  Copyright © 2020 ehis. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct TodoViewModel {
    var todos: BehaviorRelay<[TodoItem]> = BehaviorRelay(value: [])
    
    init() {
        let sampleTodoItems = [
            TodoItem(title: "Do Laundry", createdAt: Date(), modifiedAt: Date()),
            TodoItem(title: "Call my Doctor", createdAt: Date(), modifiedAt: Date(), priority: .high),
            TodoItem(title: "Buy gluten free bread", createdAt: Date(), modifiedAt: Date(), priority: .medium)
        ]
        
        todos.accept(sampleTodoItems)
    }
    
    func insert(_ todoItem: TodoItem) {
        todos.accept(todos.value + [todoItem])
    }
    
}
