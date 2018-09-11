//
//  TodosRouter.swift
//  Todo
//
//  Created by Scott Jones on 8/29/18.
//  Copyright © 2018 Stash Invest. All rights reserved.
//

import UIKit

class TodosRouter {

    weak var viewController: UIViewController?
    let dependencyProvider: DependencyProviding

    init(on window: UIWindow?, dependencyProvider: DependencyProviding) {
        self.dependencyProvider = dependencyProvider
        let vc = createViewController()
        self.viewController = vc
        window?.rootViewController = UINavigationController(rootViewController: vc)
    }

    func createViewController() -> UIViewController {
        let eventTracker = TodoEventTracker(eventTracker: MixpanelEventTracker())
        let presenter = TodosPresenter(eventTracker: eventTracker)
        let userInterface = TodosViewController()
        let interactor = TodosInteractor(database: AppDelegate.database)

        userInterface.presenter = presenter
        interactor.output = presenter
        presenter.userInterface = userInterface
        presenter.interactor = interactor
        presenter.router = self

        return userInterface
    }
}

extension TodosRouter: TodosRouterInterface {

    func sendToCreate() {
        let router = CreateTodoRouter(dependencyProvider: dependencyProvider)
        router.push(on: viewController)
    }
    
}
