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
        }.resume()
    }
    
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        do {
            let url = URL(string: "http://127.0.0.1:8080/users/login")
            var urlReq = URLRequest(url: url!)
            urlReq.setValue("application/json", forHTTPHeaderField: "Content-type")
            urlReq.httpMethod = "POST"
            
            let encoder = JSONEncoder()
            let payload = try encoder.encode(UserLogin(username: username, password: password, role: "project"))
            URLSession.shared.uploadTask(with: urlReq, from: payload) { (data, resp, err) in
                guard let data = data, err == nil else {
                               completion(.failure(.custom(errorMessage: "No data")))
                               return
                           }
                guard let token = try? JSONDecoder().decode(CurrentUser.self, from: data) else {
                                completion(.failure(.invalidCredentials))
                                return
                }
                guard let tok = token.token else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                CurrentUser.setShared(id: token.getId(), role: token.getRole(), token: token.getToken())
                completion(.success(tok))
            }.resume()
        } catch {
            print("Login failed during call")
        }
    }
    
    func register(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        do {
            let url = URL(string: "http://127.0.0.1:8080/users/register")
            var urlReq = URLRequest(url: url!)
            urlReq.setValue("application/json", forHTTPHeaderField: "Content-type")
            urlReq.httpMethod = "POST"
            
            let encoder = JSONEncoder()
            let payload = try encoder.encode(UserLogin(username: username, password: password, role: ""))
            URLSession.shared.uploadTask(with: urlReq, from: payload) { (data, resp, err) in
                guard let data = data, err == nil else {
                               completion(.failure(.custom(errorMessage: "No data")))
                               return
                           }
                guard let token = try? JSONDecoder().decode(CurrentUser.self, from: data) else {
                                completion(.failure(.invalidCredentials))
                                return
                            }
                
                CurrentUser.setShared(id: token.getId(), role: token.getRole(), token: token.getToken())
                completion(.success(token.getToken()))
                
            }.resume()
        } catch {
            print("Login failed during call")
        }
    }
}
