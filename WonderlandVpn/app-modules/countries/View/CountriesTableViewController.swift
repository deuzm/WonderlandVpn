//
//  CountriesTableViewController.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
    // MARK: - Properties
    var presenter: PresenterToViewCountriesProtocol?
    var configurator: CountriesConfigurator!
    var countries: [Country] = []
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator = CountriesConfigurator()
        configurator.configure(with: self)
        presenter?.startFetchingCountries()
        tableView.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.backgroundColor = UIColor.Custom.Black
        tableView.separatorColor = UIColor.clear
    }
}

// MARK: - Table view data source
extension CountriesTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as? CountriesTableViewCell
    
        presenter?.didSelectCountry(with: cell?.countryLabel.text ?? "")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //call presenter to return number of rows
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier) as? CountriesTableViewCell
    
        cell?.countryLabel.text = countries[indexPath.row].name
        cell?.imageString = countries[indexPath.row].image
        return cell!
    }
    
}

// MARK: - Section and header preferences
extension CountriesTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
extension CountriesTableViewController: ViewToPresenterCountriesProtocol {
    func updateData(data: [Country]) {
        countries = data
        tableView.reloadData()
    }
}
