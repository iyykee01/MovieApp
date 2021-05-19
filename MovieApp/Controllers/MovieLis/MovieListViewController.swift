//
//  ViewController.swift
//  MovieApp
//
//  Created by Ikenna on 18/05/2021.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var movieArray = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        tableView.delegate = self
        tableView.dataSource = self
        
        MovieList.shared.movieAPIrequest()
    }

}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoiveListTableViewCell
        
        cell.setUpCell(with: movieArray[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToPreview", sender: self);
    }
    
    
}

