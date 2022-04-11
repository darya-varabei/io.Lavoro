//
//  LavoroService.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 11.04.22.
//

import Foundation

protocol LavoroServiceable {
    func getAccountInfo() async -> Result<Project, RequestError>
    func getProjects() async -> Result<[Project], RequestError>
}

struct LavoroService: HTTPClient, LavoroServiceable {
    
    func getAccountInfo() async -> Result<Project, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.account, responseModel: Project.self)
    }
    
    func getProjects() async -> Result<[Project], RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.projects, responseModel: [Project].self)
    }
}
