//
//  DataManager.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/16/21.
//

import Foundation
import CoreData

class DataManager {
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
    
    func saveContext () {
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
    
    func getCountries() -> [NSManagedObject]? {
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
    
    func setCountry(countryName: String, imageName: String) {
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
                setCountry(countryName: country, imageName: image)
            }
        }
        catch {/* error handling here */}
        
        
    }
}
