//
//  PlaceListTableViewCell.swift
//  GeoPlaces
//
//  Created by Ilya Ramanenia on 6/29/18.
//  Copyright © 2018 ilyaramanenia. All rights reserved.
//

import UIKit
import Reusable

class PlaceListTableViewCell: UITableViewCell, Reusable {
    @IBOutlet weak var placeImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}
