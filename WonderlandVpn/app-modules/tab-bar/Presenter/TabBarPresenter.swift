//
//  Presenter.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class TabBarPresenter: PresenterToViewProtocol {
    
    var view: ViewToPresenterProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func mainSceneButtonTapped() {
        router?.showMainScene()
    }
    
    func showCountiesButtonTapped() {
        router?.showCountriesScene()
    }
    
    func setUpModule() {
        TabBarRouter.createTabBarModule(with: self)
    }
    
}

extension TabBarPresenter {
    
    func configureView() {
        TabBarRouter.createTabBarModule(with: self)
    }
    
}
