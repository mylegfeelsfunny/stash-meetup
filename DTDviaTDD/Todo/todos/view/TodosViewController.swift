//
//  TodosViewController.swift
//  Todo
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import UIKit

class TodosViewController: UITableViewController {

    var presenter: TodosPresenterInterface?
    var todos: [Todo] = []

    static let CellIdentifier = "Todo"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: TodosViewController.CellIdentifier)

        title = TodosLocalizedString.title
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(create))
        navigationItem.rightBarButtonItem = add

        let delete = UIBarButtonItem(title: TodosLocalizedString.deleteText, style: .done, target: self, action: #selector(deleteAll))
        navigationItem.leftBarButtonItem = delete
        tableView.accessibilityIdentifier = TodosAccessibilityIdentifier.tableView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.willAppear()
    }

    @objc func create() {
        presenter?.create()
    }

    @objc func deleteAll() {
        presenter?.deleteAll()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodosViewController.CellIdentifier) else {
            fatalError("No cell for \(TodosViewController.CellIdentifier)")
        }
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.taskName
        cell.accessoryType = todo.isCompleted ? .checkmark : .none
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        presenter?.toggle(todo: todo)
    }

}

extension TodosViewController: TodosUserInterface {

    func configure(with viewModel: TodosViewModel) {
        self.todos = viewModel.todos
        tableView.reloadData()
    }

}
