//
//  Protocols.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

//Countries configurator
protocol CountriesConfiguratorProtocol {
    func configure(with controller: CountriesTableViewController)
}

//View -> Presenter
protocol ViewToPresenterCountriesProtocol {
    func updateData(data: [Countries])
    func setUpViews()
}

// Presenter -> View
protocol PresenterToViewCountriesProtocol {
    
    var view: ViewToPresenterCountriesProtocol? { get set }
    var interactor: PresenterToInteractorCountriesProtocol? { get set }
    var router: PresenterToRouterCountriesProtocol? { get set }
    
    func startFetchingCountries()
}

// Presenter -> Interactor
protocol PresenterToInteractorCountriesProtocol {
    var presenter: InteractorToPresenterCountriesProtocol? { get set }
    func getCountries()
}

// Interactor -> Presenter
protocol InteractorToPresenterCountriesProtocol {
     func fetchSucceed(with data: [Countries])
     func fetchFailed()
}

// Presenter -> Router
protocol PresenterToRouterCountriesProtocol {
    var view: CountriesTableViewController? { get set }
    static func createTabBarModule(with presenter: TabBarPresenter)
    func returnToMainScene()
    
}

