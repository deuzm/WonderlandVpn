//
//  DataManager.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/16/21.
//

import Foundation
import CoreData

class DataManager: DataManagerProtocol {
    
    
    private static var persistentContainer: NSPersistentContainer = {
               let container = NSPersistentContainer(name: "Country")
               container.loadPersistentStores { description, error in
                   if let error = error {
                        fatalError("Unable to load persistent stores: \(error)")
                   }
               }
               return container
           }()
       
    lazy var context: NSManagedObjectContext = {
        return Self.persistentContainer.viewContext
      }()
    
    private func saveContext () {
          if context.hasChanges {
              do {
                  try context.save()
              } catch {
                context.rollback()
                  let nserror = error as NSError
                  fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
              }
          }
      }
    func delete() {
        
    }
    
    private func fetchCountries() -> [NSManagedObject]? {
        let fetchRequest: NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        let objects: [NSManagedObject]?
        do {
            objects = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error)
            objects = nil
        }
        return objects
    }
    
    func findCountry(with name: String) -> Country? {
        print(name)
        let fetchRequest: NSFetchRequest<CountryEntity> = CountryEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "country == %@", name)
        fetchRequest.sortDescriptors =  [NSSortDescriptor(keyPath: \CountryEntity.country, ascending: true)]
        fetchRequest.entity = CountryEntity.entity()
        
        var country: Country? = nil
        let objects: [CountryEntity]
        do {
            let objects = try context.fetch(fetchRequest)
            let countryObject = objects[0]
            if countryObject.country != nil {
                let name = (countryObject.country ?? "") as String
                let image = (countryObject.imageString ?? "") as String
                let id = (countryObject.id ?? UUID()) as UUID
                country = Country(with: name, imageName: image, id: id)
            }
        } catch let error as NSError {
            print(error)
            country = nil
        }
        return country
    }
    
    func getCountries() -> [Country] {
        
        guard let countries = fetchCountries()  else {
           return []
        }
        var data: [Country] = []
        for country in countries {
            let name = country.value(forKey: "country") as? String ?? ""
            let image = country.value(forKey: "imageString") as? String ?? ""
            let id = country.value(forKey: "id") as? UUID
            let object = Country(with: name, imageName: image, id: id!)
            data.append(object)
        }
        return data
    }
    
    
    func addCountry(countryName: String, imageName: String) {
        let country = CountryEntity(context: context)
        country.country = countryName
        country.imageString = imageName
        country.id = UUID()
        saveContext()
    }
    
    func addCountriesFromFile() {
        
        let countryFilePath =  "/Users/lizamalinovskaa/Documents/Projects_for_work/WonderlandVpn/WonderlandVpn/CountryDataSourceFIles/countries.txt"
        let imagesFilePath =   "/Users/lizamalinovskaa/Documents/Projects_for_work/WonderlandVpn/WonderlandVpn/CountryDataSourceFIles/imageNames.txt"
        
        //reading
        do {
            let fileNames = try String(contentsOfFile: imagesFilePath)
            let countryNames = try String(contentsOfFile: countryFilePath)
            
            let namesArray = fileNames.components(separatedBy: "\n")
            let countriesArray = countryNames.components(separatedBy: "\n")
            
            for (image, country) in zip(namesArray, countriesArray) {
                addCountry(countryName: country, imageName: image)
            }
        }
        catch {/* error handling here */}
        
        
    }
}
