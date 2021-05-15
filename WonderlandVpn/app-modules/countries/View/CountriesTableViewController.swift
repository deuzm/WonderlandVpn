//
//  CountriesTableViewController.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.backgroundColor = UIColor.Custom.Black
        tableView.separatorColor = UIColor.clear
    }
}

// MARK: - Table view data source
extension CountriesTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //call presenter to return number of rows
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.identifier)
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
