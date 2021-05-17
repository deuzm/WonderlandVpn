//
//  TabBarConfigurator.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/15/21.
//

import UIKit

class TabBarConfigurator: TabBarConfiguratorProtocol {
    
    func configure(with viewController: TabBarController) {
        let presenter = TabBarPresenter(view: viewController)
        let interactor = TabBarInteractor(presenter: presenter)
        let router = TabBarRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
