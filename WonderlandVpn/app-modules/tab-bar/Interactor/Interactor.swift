//
//  Interactor.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class TabBarInteractor: PresenterToInteractorProtocol {
    
    var presenter: PresenterToViewProtocol?
        
    required init(presenter: PresenterToViewProtocol) {
        self.presenter = presenter
    }
    
}
