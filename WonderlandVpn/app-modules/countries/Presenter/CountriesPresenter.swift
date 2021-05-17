//
//  Presenter.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class CountriesPresenter: PresenterToViewCountriesProtocol {
    
    var view: ViewToPresenterCountriesProtocol?
    
    var interactor: PresenterToInteractorCountriesProtocol?
    
    var router: PresenterToRouterCountriesProtocol?
    
    func startFetchingCountries() {
        interactor?.getCountries()
    }
    
    required init(view: ViewToPresenterCountriesProtocol) {
            self.view = view
    }
    
}

extension CountriesPresenter: InteractorToPresenterCountriesProtocol {
    func fetchSucceed(with data: [Countries]) {
        view?.updateData(data: data)
    }
    func fetchFailed() {
        //TODO
    }
}
