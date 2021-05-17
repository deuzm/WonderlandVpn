//
//  CountriesConfigurator.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/16/21.
//

import Foundation

class CountriesConfigurator: CountriesConfiguratorProtocol {
    
    func configure(with viewController: CountriesTableViewController) {
        let presenter = CountriesPresenter(view: viewController)
        let interactor = CountriesInteractor(presenter: presenter)
        let router = CountriesRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
}
