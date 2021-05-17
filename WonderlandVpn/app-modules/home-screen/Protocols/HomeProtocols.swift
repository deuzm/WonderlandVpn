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
    func setUpViews()
    func setCountryUI(with data: Country)
}

// Presenter -> View
protocol HomePresenterToViewProtocol {
    
    var view: HomeViewToPresenterProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    func startFetchingCurrentCountry()
    func viewWillAppear()
    func vpnButtonTapped()
}

// Presenter -> Interactor
protocol HomePresenterToInteractorProtocol {
    var currentCountry: Country? { get set }
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func fetchCurrentCountry()
}

// Interactor -> Presenter
protocol HomeInteractorToPresenterProtocol {
    func fetchSucceed(with data: Country)
    func fetchFailed()
}

// Presenter -> Router
protocol HomePresenterToRouterProtocol {
    var view: HomeViewController? { get set }
}

