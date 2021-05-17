//
//  CountriesTableViewCell.swift
//  WonderlandVpn
//
//  Created by Лиза  Малиновская on 5/14/21.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    
    static let identifier = "CountriesCell"
    
    var imageString: String = " " {
        didSet {
            flagImage.image = UIImage(named: imageString)
        }
    }
    
    lazy var flagImage: UIImageView = {
        let image = UIImage(named: imageString)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 20, y: self.bounds.height/2 - 10, width: 25, height: 25)
        return imageView
    }() 
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 14)
        label.frame = CGRect(x: 20, y: 10, width: self.bounds.width - 100, height: 20)
        return label
    }()
    
    lazy var innerBox: UIView = {
        let view = UIView.init(frame: CGRect(x: 0.0, y: 0.0, width: self.bounds.width - 40, height: self.bounds.height - 15))
        view.backgroundColor = UIColor.Custom.DarkGrey
        view.layer.cornerRadius = 24
        view.backgroundColor = UIColor.Custom.DarkGrey
        view.addSubview(countryLabel)
        view.addSubview(flagImage)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(imageView!)
    
        self.addSubview(innerBox)
        
        layoutSubviews()
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.backgroundColor = UIColor.Custom.Black
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let labelY = 7.5
        innerBox.frame = CGRect(x: 15, y: 6, width: self.bounds.width - 30, height: self.bounds.height - 12)
        imageView?.frame = CGRect(x: innerBox.bounds.minX + 10, y: 5, width: 10, height: 10)
        let labelX = 20.0 + (imageView?.bounds.width ?? 0) + 30.0;
        countryLabel.frame = CGRect(x: labelX, y: 13, width: 200, height: 20)
    }

}
