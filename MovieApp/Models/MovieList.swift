//
//  DogListModel.swift
//  Dog Listings
//
//  Created by Ikenna on 19/05/2021.
//

import Foundation

class MovieList {
    
    /*:
     Created a static variable instanciating the DogBreedApi class
     So i don't created instaces whenever i need to call the DogBreedApi
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
            
            print(movies)
            completion(movies.movies)
        }
        dataTask.resume()
    }
    
}

struct MoviesData: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    
    let title: String?
    let year: String?
    let rate: Double?
    let posterImage: String?
    let overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}
