//
//  CountryModel.swift
//  CountryFacts
//
//  Created by Павел Кай on 16.08.2022.
//

import Foundation

func fetchJSON(onCompletion: @escaping ([Country]) -> ()) {
    let urlString = "https://restcountries.com/v3.1/all"

    let url = URL(string: urlString)!
    
    let task = URLSession.shared.dataTask(with: url) { data, resp, error in
        guard let data = data else {
            print("data nil")
            return
        }
        
        guard let countries = try? JSONDecoder().decode([Country].self, from: data) else {
            print("decode error")
            return
        }
        
        onCompletion(countries)

    }
    task.resume()
    
}


struct Country: Codable {
    let name: Name
    let capital: [String]?
    let flag: String
    let currencies: [String : Currency]?
    let languages: [String : String]?
    let region: String
    let status: String
    let landlocked: Bool
}

struct Name: Codable {
    let common: String?
    let official: String?
    let nativeName: [String : NativeName]?
}

struct NativeName: Codable {
    let official: String?
    let common: String?
}

struct Currency: Codable {
    let name: String?
    let symbol: String?
}


