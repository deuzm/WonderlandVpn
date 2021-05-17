//
//  HomeProtocols.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/17/21.
//

import Foundation
import UIKit

protocol HomeConfiguratorProtocol {
    func configure(with controller: HomeViewController)
}

//View -> Presenter
protocol HomeViewToPresenterProtocol {
    func setCountryUI(with data: Country)
    func startPulsingAnimation()
    func stopPulsingAnimation()
    func resetAnimation()
}

// Presenter -> View
protocol HomePresenterToViewProtocol {
    
    var view: HomeViewToPresenterProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    func startFetchingCurrentCountry()
    func startConnectingToVPN()
    func refreshState()
}

// Presenter -> Interactor
protocol HomePresenterToInteractorProtocol {
    var state: String { get set }
    var currentCountry: Country? { get set }
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func fetchCurrentCountry()
    func connectToVPN()
}

// Interactor -> Presenter
protocol HomeInteractorToPresenterProtocol {
    func fetchSucceed(with data: Country)
    func connectionCompleted()
}

// Presenter -> Router
protocol HomePresenterToRouterProtocol {
    var view: HomeViewController? { get set }
}

