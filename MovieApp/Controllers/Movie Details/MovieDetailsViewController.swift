//
//  DogPreviewViewController.swift
//  MovieApp
//
//  Created by Ikenna on 19/05/2021.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    
    let screenRect = UIScreen.main.bounds
    
    @IBOutlet weak var imageBanner: UIImageView!
    @IBOutlet weak var name: UILabelDeviceClass!
    @IBOutlet weak var movieRating: UILabelDeviceClass!
    @IBOutlet weak var movieYear: UILabelDeviceClass!
    @IBOutlet weak var movieDescription: UILabelDeviceClass!
    @IBOutlet weak var favourite_button: UIButton!
    
    var favourite = false
    var selectedMovie: Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayMovieInfo();
    }
    
   
    //MARK: -  This method will display Movie data from previous screen index
    func displayMovieInfo() {
    
        let imageUrl = selectedMovie?.posterImage
        guard let imgExtString = imageUrl else {return}
        let urlString = "https://image.tmdb.org/t/p/w300" + imgExtString
        imageBanner.kf.setImage(with: URL(string: urlString))
        
        name.text = selectedMovie?.title
        movieDescription.text = selectedMovie?.overview
        movieRating.text = selectedMovie?.rate?.description
        
        let convertedDate = HelperFunctions.helpers.convertDateFormat(inputDate: selectedMovie?.year ?? "")
        
        movieYear.text = convertedDate
        
    }
    
  
    //MARK: - Method will toggle favorite state
    @IBAction func favouriteButtonPressed(_ sender: Any) {
        favourite.toggle()
        
        favourite ? favourite_button.setImage(UIImage(systemName: "star.fill"), for: .normal) : favourite_button.setImage(UIImage(systemName: "star" ), for: .normal)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true);
    }
    
}
