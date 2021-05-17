//
//  Router.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class CountriesRouter: PresenterToRouterCountriesProtocol {

    var view: CountriesTableViewController?
    
    func returnToMainScene(with country: Country) {
        let parentView = view?.tabBarController as! TabBarController
        parentView.mainVC.currentCountry = country
        parentView.mainVC.stateString = "Connect"
        parentView.mainVC.presenter?.interactor?.state = "inactive"
        parentView.selectedIndex = 0
        
    }
    
    required init(viewController: CountriesTableViewController) {
        view = viewController
    }
    
}
