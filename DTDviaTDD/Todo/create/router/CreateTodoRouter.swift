//
//  CreateTodoRouter.swift
//  Todo
//
//  Created by Scott Jones on 8/31/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import UIKit

class CreateTodoRouter {
    
    weak var viewController: UIViewController?
    let dependencyProvider: DependencyProviding

    init(dependencyProvider: DependencyProviding) {
        self.dependencyProvider = dependencyProvider
    }

    func push(on viewController: UIViewController?) {
        let vc = createViewController()
        self.viewController = vc
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

    func createViewController() -> UIViewController {
        let eventTracker = TodoEventTracker(eventTracker: dependencyProvider.eventTracker)
        let presenter = CreateTodoPresenter(eventTracker: eventTracker)
        let userInterface = CreateTodoViewController()
        let interactor = TodosInteractor(database:  dependencyProvider.database)

        userInterface.presenter = presenter
        interactor.output = presenter
        presenter.userInterface = userInterface
        presenter.interactor = interactor
        presenter.router = self

        return userInterface
    }
}

extension CreateTodoRouter: CreateTodoRouterInterface {

    func dismiss() {
        viewController?.navigationController?.popViewController(animated: true)
    }

}
