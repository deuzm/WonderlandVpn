//
//  Interactor.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class CountriesInteractor: PresenterToInteractorCountriesProtocol {

    var presenter: InteractorToPresenterCountriesProtocol?
    private var countryObject = DataManager()
    var currentCountry: Country?
    
    func getCountries() {
        DispatchQueue.main.async {
            var data = self.countryObject.getCountries()
            data.removeAll(where: { it in
                return it.name == ""
            })
            
            self.presenter?.fetchSucceed(with: data)
            
//                self.presenter?.fetchFailed()
            
        }
    }
    
    func saveSelectedCountry(with name: String) {
        
        if let country = self.countryObject.findCountry(with: name) {
            let manager = MyFileManager()
            self.currentCountry = country
            manager.writeCurrentCountry(country)
        } else {
            print("YOU SCUMBAG")
        }
        
    }

    required init(presenter: InteractorToPresenterCountriesProtocol) {
        self.presenter = presenter
    }
}
