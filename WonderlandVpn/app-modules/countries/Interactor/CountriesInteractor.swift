//
//  Interactor.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class CountriesInteractor: PresenterToInteractorCountriesProtocol {
    
    var presenter: InteractorToPresenterCountriesProtocol?
    
    func getCountries() {
        DispatchQueue.main.async {
            let countryObject = DataManager()
            if let countries = countryObject.getCountries() {
                var data: [Countries] = []
                for country in countries {
                    let name = country.value(forKey: "country") as? String ?? ""
                    let image = country.value(forKey: "imageString") as? String ?? ""
                    let object = Countries(with: name, imageName: image)
                    data.append(object)
                }
                self.presenter?.fetchSucceed(with: data)
            } else {
                self.presenter?.fetchFailed()
            }
        }
    }
    
    required init(presenter: InteractorToPresenterCountriesProtocol) {
        self.presenter = presenter
    }
}
