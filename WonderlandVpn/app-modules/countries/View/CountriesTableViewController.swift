//
//  CountriesTableViewController.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
// MARK:- header views
    lazy var coutriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Countries"
        label.font = .systemFont(ofSize: 20)
        label.frame = CGRect(x: 20,
                             y: 20,
                             width: 100,
                             height: 20)
        return label
    }()
    
    lazy var headerBox: UIView = {
        let view = UIView.init(frame: CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: 60))
        view.backgroundColor = UIColor.clear
        var countries = coutriesLabel
        view.addSubview(countries)
        return view
    }()
    
    // MARK: - Properties
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.identifier)
        
    }
    override func viewWillAppear(_ animated: Bool) {
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerBox
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}
