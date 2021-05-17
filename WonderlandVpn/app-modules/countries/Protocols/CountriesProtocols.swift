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

protocol DataManagerProtocol {
    func getCountries() -> [Country]
    func findCountry(with name: String) -> Country?
}

//View -> Presenter
protocol ViewToPresenterCountriesProtocol {
    func updateData(data: [Country])
    func setUpViews()
}

// Presenter -> View
protocol PresenterToViewCountriesProtocol {
    
    var view: ViewToPresenterCountriesProtocol? { get set }
    var interactor: PresenterToInteractorCountriesProtocol? { get set }
    var router: PresenterToRouterCountriesProtocol? { get set }
    
    func didSelectCountry(with name: String)
    func startFetchingCountries()
}

// Presenter -> Interactor
protocol PresenterToInteractorCountriesProtocol {
    var currentCountry: Country? { get set }
    var presenter: InteractorToPresenterCountriesProtocol? { get set }
    func getCountries()
    func saveSelectedCountry(with name: String)
}

// Interactor -> Presenter
protocol InteractorToPresenterCountriesProtocol {
    
     func fetchSucceed(with data: [Country])
     func fetchFailed()
}

// Presenter -> Router
protocol PresenterToRouterCountriesProtocol {
    var view: CountriesTableViewController? { get set }
    static func createTabBarModule(with presenter: TabBarPresenter)
    func returnToMainScene(with country: Country)
    
}

