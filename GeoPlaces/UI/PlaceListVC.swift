//
//  PlaceListVC.swift
//  GeoPlaces
//
//  Created by Ilya Ramanenia on 6/29/18.
//  Copyright © 2018 ilyaramanenia. All rights reserved.
//

import UIKit
import Reusable
import AlamofireImage

class PlaceListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    fileprivate var places = Place.fakePlaces.sorted { (l, r) -> Bool in
        return l.score > r.score
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as PlaceListTableViewCell
        
        let place = places[indexPath.row]
        
        cell.nameLabel.text = " \(place.name) "
        cell.nameLabel.backgroundColor = UIColor.red.blend(UIColor.blue, proportion: CGFloat(place.score / 5))
        cell.descriptionLabel.text = String(place.description.prefix(100)) + "..."
        cell.scoreLabel.text = String(place.score)
        
        if let urlString = place.imageURL, let url = URL(string: urlString) {
            cell.placeImageView?.af_setImage(withURL: url)
        } else {
            cell.placeImageView?.image = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let place = places[indexPath.row]
        
        let placeVC = PlaceVC.instantiate()
        placeVC.place = place
        navigationController?.pushViewController(placeVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}
