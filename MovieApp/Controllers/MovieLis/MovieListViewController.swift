//
//  ViewController.swift
//  MovieApp
//
//  Created by Ikenna on 18/05/2021.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var viewWrapper: UIView!
    
    var movieArray = [Movie]()
    var filterMovie = [Movie]()
    
    var showTextField = false
    var searching = false
    var selectedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        tableView.delegate = self
        tableView.dataSource = self
        self.viewWrapper.alpha = 0
        searchTextField.delegate = self
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        /*
         Calling API moview request to fetch data
         And assign data to our array above
         */
        MovieList.shared.movieAPIrequest { [self] (movie) in
            DispatchQueue.main.async {
                movieArray = movie
                tableView.reloadData();
            }
            
        }
    }
    
    //MARK:  - Search textfield appears should appear on button is pressed.
    @IBAction func searchButtonPressed(_ sender: Any) {
        showTextField.toggle();
        if showTextField {
            searchTextField.becomeFirstResponder()
            UIView.animate(withDuration: 0.2, delay: 0.3, options: [.curveEaseInOut], animations: {
                self.viewWrapper.alpha = 1

            })
        }
        else {
            view.endEditing(true);
            UIView.animate(withDuration: 0.2, delay: 0.3, options: [.curveEaseInOut], animations: {
                self.viewWrapper.alpha = 0
            })
        }
    }
    
    //MARK: - Method will increase table view rowhieght for either landscape mode or potrait mode
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            tableView.rowHeight =  250
        }
        else {
            tableView.rowHeight =  180
        }
    }
    
    
    //MARK: - Mehtod to pass data after between screens
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPreview" {
            let destination = segue.destination as? MovieDetailsViewController
            destination?.selectedMovie = selectedMovie
        }
    }
    
}


//Text field delegate
extension MovieListViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.viewWrapper.alpha = 0
        return view.endEditing(true);
        
    }
    
    //************Handles search when input text is filled************//
    @objc func textFieldDidChange(_ textField: UITextField) {
        searching = true
        let searchText = searchTextField.text
        
        filterMovie = movieArray.filter({$0.title!.lowercased().prefix(searchText!.count) == searchText!.lowercased()})

        tableView.reloadData()
    }
}


//MARK: - Tableview delegate and data source
extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? filterMovie.count : movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoiveListTableViewCell
        cell.selectionStyle = .none
        
        searching ? cell.setUpCell(with: filterMovie[indexPath.row]) : cell.setUpCell(with: movieArray[indexPath.row])

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        if searching {
           selectedMovie = filterMovie[indexPath.row]
        }
        else {
            selectedMovie = movieArray[indexPath.row]
            
        }
        performSegue(withIdentifier: "goToPreview", sender: self);
    }
    
    
}

