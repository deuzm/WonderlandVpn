//
//  HomeConfigurator.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/17/21.
//

import Foundation

class HomeConfigurator: HomeConfiguratorProtocol {
    
    func configure(with viewController: HomeViewController) {
        let presenter = HomePresenter(view: viewController)
        let interactor = HomeInteractor(presenter: presenter)
        let router = HomeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
