//
//  ApiService.swift
//  mineexchange
//
//  Created by Frd on 20/08/24.
//

import Foundation

class ApiService {
    func fetchMineExchangeDetails(completion: @escaping (Result<MineExchangeModel, Error>) -> Void) {
        
        let urlString = "https://stagingapi.theminexchange.com/api/v1/user/featured-projects"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Data error", code: 0, userInfo: nil)))
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                   print("Received JSON: \(jsonString)")
               }

            
            do {
                let mineExchangeModel = try JSONDecoder().decode(MineExchangeModel.self, from: data)
                completion(.success(mineExchangeModel))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume() 
    }
    
    func fetchProjectFilters(completion: @escaping (Result<FilterModel, Error>) -> Void) {
        let urlString = "https://stagingapi.theminexchange.com/api/v1/user/project-filters"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Data error", code: 0, userInfo: nil)))
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            }

            do {
                let projectFiltersModel = try JSONDecoder().decode(FilterModel.self, from: data)
                completion(.success(projectFiltersModel))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

}

