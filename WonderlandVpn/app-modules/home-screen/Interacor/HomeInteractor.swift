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
    
    var isAnimationRunning: Bool = false
    var state: String = "inactive"
    
    func fetchCurrentCountry() {
        currentCountry = MyFileManager().readCurrentCountry()
        if(currentCountry != nil) {
            presenter?.fetchSucceed(with: currentCountry!)
        }
    }
    
    func connectToVPN() {
        if state == "connecting" {
            return
        }
        state = "connecting"
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (_) in
            self.state = "connected"
            self.presenter?.connectionCompleted()
        }
    }
    
    required init(presenter: HomeInteractorToPresenterProtocol) {
        self.presenter = presenter
    }

}
