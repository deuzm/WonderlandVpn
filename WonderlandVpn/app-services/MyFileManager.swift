//
//  MyFileManager.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/17/21.
//

import Foundation

class MyFileManager {
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func writeCurrentCountry(_ country: Country) {
        var dataString = ""
        var data: Data
        do {
            let coder = JSONEncoder()
            data = try coder.encode(country)
            dataString = String(decoding: data, as: UTF8.self)
        } catch {
            print(error)
        }
        let filename = self.getDocumentsDirectory().appendingPathComponent("currentCountry.txt")
        do {
            try dataString.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print(error)
        }
        
    }
    
    func readCurrentCountry() -> Country? {
        var result: Data
        var country: Country?
        
        let filename = self.getDocumentsDirectory().appendingPathComponent("currentCountry.txt")
        do {
            try result = Data(contentsOf: filename)
            do {
                let coder = JSONDecoder()
                country = try coder.decode(Country.self, from: result)
            } catch {
                print(error)
            }
        } catch {
            return Country(with: "Belarus", imageName: "152-belarus.png", id: UUID())
        }
        return country
    }
    
}


