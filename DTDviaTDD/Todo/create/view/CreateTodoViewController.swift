//
//  CreateTodoViewController.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import UIKit

class CreateTodoViewController: UITableViewController {

    var presenter: CreateTodoPresenterInterface?

    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.didLoad()
    }

    @objc func editingDidEndOnExit(_ sender: Any) {
        guard let text = textField.text, text != "" else {
            presenter?.dismiss()
            return
        }
        presenter?.createTodo(with: text)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = CreateTodoLocalizedString.taskNameLabel
        cell.contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addConstraints([
            textField.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            textField.trailingAnchor.constraint(equalTo: cell.contentView.layoutMarginsGuide.trailingAnchor),
            textField.leadingAnchor.constraint(equalTo: cell.textLabel!.trailingAnchor, constant: 20)
        ])
        textField.addTarget(self, action: #selector(editingDidEndOnExit(_:)), for: .editingDidEndOnExit)
        return cell
    }

}

extension CreateTodoViewController: CreateTodoUserInterface {

    func configure() {
        textField.becomeFirstResponder()
    }
    
}
