//
//  Protocols.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

//View -> Presenter
protocol ViewToPresenterProtocol {
    func setUpViews()
}

// Presenter -> View
protocol PresenterToViewProtocol {
    
    var view: ViewToPresenterProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    
    func mainSceneButtonTapped()
    func showCountiesButtonTapped()
    func setUpModule()
}

// Presenter -> Interactor
protocol PresenterToInteractorProtocol {
    
}

// Interactor -> Presenter
protocol InteractorToPresenterProtocol {
    
}

// Presenter -> Router
protocol PresenterToRouterProtocol {
    
    static func createTabBarModule(with presenter: TabBarPresenter)
    func showMainScene()
    func showCountriesScene()
    
}

