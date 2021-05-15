//
//  Router.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation
import UIKit

class TabBarRouter: PresenterToRouterProtocol {
    
    var view: ViewToPresenterProtocol?
    
    required init(viewController: UIViewController) {
        view = viewController as? ViewToPresenterProtocol
    }
    
    func showMainScene() {
        print("haha")
    }
    
    func showCountriesScene() {
        print("haha")
    }
    
    
}
