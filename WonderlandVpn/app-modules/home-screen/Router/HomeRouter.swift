//
//  Router.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class HomeRouter: HomePresenterToRouterProtocol {
    var view: HomeViewController?
    
    required init(viewController: HomeViewController) {
        view = viewController
    }
}
