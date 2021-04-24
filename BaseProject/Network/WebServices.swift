//
//  WebServices.swift
//  BaseProject
//
//  Created by Ton Wang on 4/13/21.
//

import UIKit

public class WebServices: NSObject {
    private func sendGetRequest(_ url: URL, parameters: [String: String], completion: @escaping (Data?, Error?) -> Void) {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data,                            // is there data
                let response = response as? HTTPURLResponse,  // is there HTTP response
                (200 ..< 300) ~= response.statusCode,         // is statusCode 2XX
                error == nil else {                           // was there no error, otherwise ...
                    completion(nil, error)
                    return
            }
            
            completion(data, nil)
        }
        task.resume()
    }
    
    private func sendGetRequest(_ url: URL, completion: @escaping (Data?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data,
                  error == nil else {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }
        task.resume()
    }
    
    func getFilmList(completion: @escaping ([Movie]?, Error?) -> Void){
        let url = MovieConstants.movieUrl
        sendGetRequest(url) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            }
            else{
                print(data)
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = MovieConstants.dateFormat
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                if let movies = try? decoder.decode(Movies.self, from: data!) {
                    print(movies.results)
                    completion(movies.results, nil)
                }
                else {
                    completion(nil, nil)
                }
            }
        }
    }
    
    func getCharacter(url: URL, completion: @escaping (Character?, Error?) -> Void){
        sendGetRequest(url) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            }
            else{
                print(data)
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = MovieConstants.dateFormat
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                if let character = try? decoder.decode(Character.self, from: data!) {
                    print(character)
                    completion(character, nil)
                }
                else {
                    completion(nil, nil)
                }
            }
        }
    }
}
