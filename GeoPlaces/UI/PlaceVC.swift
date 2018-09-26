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

class PlaceVC: UIViewController, StoryboardSceneBased, UITableViewDelegate, UITableViewDataSource {
    static var sceneStoryboard: UIStoryboard { return UIStoryboard.main }
    
    @IBOutlet weak var placeImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var place: Place!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = " \(place.name) "
        nameLabel.backgroundColor = UIColor.red.blend(UIColor.blue, proportion: CGFloat(place.score / 5))
        descriptionLabel.text = place.description
        scoreLabel.text = String(place.score)
        
        if let urlString = place.imageURL, let url = URL(string: urlString) {
            placeImageView?.af_setImage(withURL: url)
        } else {
            placeImageView?.image = nil
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as PlaceReviewTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
