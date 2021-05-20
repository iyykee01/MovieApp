//
//  File.swift
//  MovieApp
//
//  Created by Ikenna on 20/05/2021.
//

import Foundation

class HelperFunctions {
    
    static var helpers = HelperFunctions()
    
    // Formating date structure.
    func convertDateFormat(inputDate: String) -> String {

         let olDateFormatter = DateFormatter()
         olDateFormatter.dateFormat = "yyyy-MM-dd"

        // Convert string to date
         let oldDate = olDateFormatter.date(from: inputDate)

         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "MMM dd yyyy"

        //return new formated date as string
         return convertDateFormatter.string(from: oldDate!)
    }
}
