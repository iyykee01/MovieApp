//
//  DogPreviewViewController.swift
//  MovieApp
//
//  Created by Ikenna on 19/05/2021.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var imageBanner: UIImageView!
    @IBOutlet weak var name: UILabelDeviceClass!
    @IBOutlet weak var bred_for: UILabelDeviceClass!
    @IBOutlet weak var imperialHeight: UILabelDeviceClass!
    @IBOutlet weak var matricHeight: UILabelDeviceClass!
    @IBOutlet weak var imperialWeight: UILabelDeviceClass!
    @IBOutlet weak var matricWeight: UILabelDeviceClass!
    
    
    @IBOutlet weak var origin: UILabelDeviceClass!
    @IBOutlet weak var life_span: UILabelDeviceClass!
    @IBOutlet weak var movieDescription: UILabelDeviceClass!
    @IBOutlet weak var favourite_button: UIButton!
    
    var favourite = false
    var selectedMovie: Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayMovieInfo();
        
       
    }
    
    //TODO: - Add method to set up view on view load
    /*
     This method will display dog data from previous screen index
     */
    
    func displayMovieInfo() {
        let imageUrl = selectedMovie?.posterImage
        guard let imgExtString = imageUrl else {return}
        let urlString = "https://image.tmdb.org/t/p/w300" + imgExtString
        imageBanner.kf.setImage(with: URL(string: urlString))
        
        name.text = "Name: \(selectedMovie?.title ?? "")"
        movieDescription.text = selectedMovie?.overview
        
    }
    
  
    //Method will toggle favorite state
    @IBAction func favouriteButtonPressed(_ sender: Any) {
        favourite.toggle()
        
        favourite ? favourite_button.setImage(UIImage(systemName: "star.fill"), for: .normal) : favourite_button.setImage(UIImage(systemName: "star" ), for: .normal)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true);
    }
    

}
