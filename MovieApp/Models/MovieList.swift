//
//  DogListModel.swift
//  Dog Listings
//
//  Created by Ikenna on 19/05/2021.
//

import Foundation
import UIKit

class MovieList {
    
    /*:
     Created a static variable instanciating the MovieList class
     So i don't created instaces whenever i need to call the MovieList
     */
    static let shared = MovieList()
    
    private let baseURL = "https://api.themoviedb.org/3/movie/popular?api_key=4e0be2c22f7268edffde97481d49064a&language=en-US&page=1"
 
    
    
    func movieAPIrequest (completion: @escaping([Movie]) -> ()) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "\(baseURL)")! as URL)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data else {
                print("Network error: \(error!.localizedDescription)")
                return
            }
            
            
            guard let movies = try? JSONDecoder().decode(MoviesData.self, from: data) else {
                print("Couldn't decode json")
                return
            }
            completion(movies.movies)
        }
        dataTask.resume()
    }

    
}

struct MoviesData: Codable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

//Movie Model
struct Movie: Codable {
    
    let title: String?
    let year: String?
    let rate: Double?
    let posterImage: String?
    var overview: String?
    
    // Set default Movie parameters for movie model
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}
