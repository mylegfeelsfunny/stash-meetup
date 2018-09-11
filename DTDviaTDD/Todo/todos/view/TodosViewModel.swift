//
//  TodosViewModel.swift
//  Todo
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import UIKit

struct TodosViewModel {
    let todos: [Todo]
}

extension TodosViewModel {

   static func viewModel(todos: [Todo]) -> TodosViewModel {
      return TodosViewModel(todos: todos)
   }
    
}
