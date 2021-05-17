//
//  Entity.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import Foundation

class Country: Codable {
    public var name: String
    public var image: String
    public var id: UUID
    public init(with name: String, imageName: String, id: UUID) {
        self.name = name
        self.image = imageName
        self.id = id
    }
}
