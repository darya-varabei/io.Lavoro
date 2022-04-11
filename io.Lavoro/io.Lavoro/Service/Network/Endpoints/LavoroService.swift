//
//  LavoroService.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 11.04.22.
//

import Foundation

protocol MoviesServiceable {
    func getAccountInfo() async -> Result<WrappedAccount, RequestError>
    func getProjects() async -> Result<[Project], RequestError>
}

struct MoviesService: HTTPClient, MoviesServiceable {
    func getAccountInfo() async -> Result<WrappedAccount, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.account, responseModel: WrappedAccount.self)
    }
    
    func getProjects() async -> Result<[Project], RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.projects, responseModel: [Project].self)
    }
}
