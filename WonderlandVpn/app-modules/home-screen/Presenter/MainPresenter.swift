//
//  Presenter.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class HomePresenter: HomePresenterToViewProtocol {
    
    var view: HomeViewToPresenterProtocol?
    
    var interactor: HomePresenterToInteractorProtocol?
    
    var router: HomePresenterToRouterProtocol?
    
    func startConnectingToVPN() {
        view?.startPulsingAnimation()
        interactor?.connectToVPN()
    }
    
    func viewWillAppear() {
//        view?.setCountryUI(with: (interactor?.currentCountry)!)
    }
    
    func refreshState() {
        var state = interactor?.state
        if(state == "inactive") {
            view?.resetAnimation()
        }
        else if (state == "connecting") {
            view?.startPulsingAnimation()
        }
        else if (state == "connected"){
            view?.stopPulsingAnimation()
        }
    }
    
    func startFetchingCurrentCountry() {
        interactor?.fetchCurrentCountry()
    }
    required init(view: HomeViewToPresenterProtocol) {
            self.view = view
    }
    
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    func fetchSucceed(with data: Country) {
        view?.setCountryUI(with: data)
    }
    
    func fetchFailed() {
        
    }
    
    func connectionCompleted() {
        view?.stopPulsingAnimation()
    }
}
