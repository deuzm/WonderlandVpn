//
//  CountryEntity+CoreDataProperties.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/16/21.
//
//

import Foundation
import CoreData


extension CountryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryEntity> {
        return NSFetchRequest<CountryEntity>(entityName: "CountryEntity")
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
    
        imageString = "001-paraguay.png"
        country = "Paraguay"
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var imageString: String?
    @NSManaged public var country: String?

}

extension CountryEntity : Identifiable {

}
