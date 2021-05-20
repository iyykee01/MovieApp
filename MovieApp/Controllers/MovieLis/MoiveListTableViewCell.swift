//
//  DogListTableViewCell.swift
//  MovieApp
//
//  Created by Ikenna on 19/05/2021.
//

import UIKit
import Kingfisher

class MoiveListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabelDeviceClass!
    @IBOutlet weak var movieYear: UILabelDeviceClass!
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
        movieYear.text = movie.overview
        movieDescription.text =  "1 hour 30mins"
        
        let imageUrl = movie.posterImage
        guard let imgExtString = imageUrl else {return}
        let urlString = "https://image.tmdb.org/t/p/w300" + imgExtString
        
        movieImage.kf.setImage(with: URL(string: urlString))
        
    }

}
