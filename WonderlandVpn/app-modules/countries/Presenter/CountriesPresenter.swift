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
    
    func didSelectCountry(with name: String) {
        interactor?.saveSelectedCountry(with: name)
        router?.returnToMainScene(with: (interactor?.currentCountry)!)
    }
    
    required init(view: ViewToPresenterCountriesProtocol) {
            self.view = view
    }
    
}

extension CountriesPresenter: InteractorToPresenterCountriesProtocol {
    func fetchSucceed(with data: [Country]) {
        view?.updateData(data: data)
    }
}
