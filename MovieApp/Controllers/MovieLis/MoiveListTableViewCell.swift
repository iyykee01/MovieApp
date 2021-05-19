//
//  DogListTableViewCell.swift
//  MovieApp
//
//  Created by Ikenna on 19/05/2021.
//

import UIKit

class MoiveListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieYear: UILabelDeviceClass!
    @IBOutlet weak var movieTitle: UILabelDeviceClass!
    @IBOutlet weak var movieDescription: UILabelDeviceClass!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(with movie: Movie) {
        
        movieTitle.text = movie.title
        movieYear.text = movie.year
        movieDescription.text = movie.overview
        
    }

}
