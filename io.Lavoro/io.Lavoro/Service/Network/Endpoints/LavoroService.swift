//
//  LavoroService.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 11.04.22.
//

import Foundation

protocol LavoroServiceable {
    func getApplicantInfo() async -> Result<Applicant, RequestError>
    func getProjectInfo() async -> Result<Project, RequestError>
    func getProjects() async -> Result<[Project], RequestError>
}

struct LavoroService: HTTPClient, LavoroServiceable {
    
    func getApplicantInfo() async -> Result<Applicant, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.applicant, responseModel: Applicant.self)
    }
    
    func getProjectInfo() async -> Result<Project, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.project, responseModel: Project.self)
    }
    
    func getProjects() async -> Result<[Project], RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.projects, responseModel: [Project].self)
    }
}
