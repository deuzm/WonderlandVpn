//
//  Interactor.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class HomeInteractor: HomePresenterToInteractorProtocol {
    
    var currentCountry: Country?
    
    var presenter: HomeInteractorToPresenterProtocol?
    
    func fetchCurrentCountry() {
        currentCountry = MyFileManager().readCurrentCountry()
        if(currentCountry != nil) {
            presenter?.fetchSucceed(with: currentCountry!)
        }
    }
    
    required init(presenter: HomeInteractorToPresenterProtocol) {
        self.presenter = presenter
    }

}
