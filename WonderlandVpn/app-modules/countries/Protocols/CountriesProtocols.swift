//
//  Protocols.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

//View -> Presenter
protocol ViewToPresenterCountriesProtocol {
    func setUpViews()
}

// Presenter -> View
protocol PresenterToViewCountriesProtocol {
    
    var view: ViewToPresenterCountriesProtocol? { get set }
    var interactor: PresenterToInteractorCountriesProtocol? { get set }
    var router: PresenterToRouterCountriesProtocol? { get set }
    
    func setUpModule()
}

// Presenter -> Interactor
protocol PresenterToInteractorCountriesProtocol {
    
}

// Interactor -> Presenter
protocol InteractorToPresenterCountriesProtocol {
    
}

// Presenter -> Router
protocol PresenterToRouterCountriesProtocol {
    
    static func createTabBarModule(with presenter: TabBarPresenter)
    func returnToMainScene()
    
}

