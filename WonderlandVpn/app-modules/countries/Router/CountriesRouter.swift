//
//  Router.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class CountriesRouter: PresenterToRouterCountriesProtocol {
    var view: CountriesTableViewController?
    
    static func createTabBarModule(with presenter: TabBarPresenter) {
        
    }
    func returnToMainScene() {
        
    }
    
    required init(viewController: CountriesTableViewController) {
        view = viewController
    }
    
}
