//
//  WebService.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 21.03.22.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String?
    let message: String?
    let success: Bool?
}

class Webservice {
    
    func getAllAccounts(token: String, completion: @escaping (Result<[User], NetworkError>) -> Void) {
        
        guard let url = URL(string: "https://strong-spangled-apartment.glitch.me/accounts") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
            
//            guard let accounts = try? JSONDecoder().decode([User].self, from: data) else {
//                completion(.failure(.decodingError))
//                return
//            }
//            
//            completion(.success(accounts))
        }.resume()
    }
    
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        do {
            let url = URL(string: "http://127.0.0.1:8080/users/login")
            var urlReq = URLRequest(url: url!)
            urlReq.setValue("application/json", forHTTPHeaderField: "Content-type")
            urlReq.httpMethod = "POST"
            
            let encoder = JSONEncoder()
            let payload = try encoder.encode(UserLogin(username: username, password: password))
            print("login payload \(payload)")
            URLSession.shared.uploadTask(with: urlReq, from: payload) { (data, resp, err) in
                print("login attempt complete")
                guard let data = data else { return }
                
                let token = String(data: data, encoding: String.Encoding.utf8)
                print("login token: \(token)")
                //self.token = token
                //self.store
            }.resume()
        } catch {
            print("Login failed during call")
        }
    }
}
