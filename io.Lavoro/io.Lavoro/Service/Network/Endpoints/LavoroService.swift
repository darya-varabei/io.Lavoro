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
    
    func getApplicants() async -> Result<[Applicant], RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.applicants, responseModel: [Applicant].self)
    }
    
    func getParametrizedApplicants() async -> Result<[Applicant], RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.parametrizedApplicants, responseModel: [Applicant].self)
    }
    
    func getParametrizedProjects() async -> Result<[Project], RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.parametrizedProjects, responseModel: [Project].self)
    }
    
    func createProject() async -> Result<Project, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.createProject, responseModel: Project.self)
    }
    
    func createApplicant() async -> Result<Applicant, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.createApplicant, responseModel: Applicant.self)
    }
    
    func sendApplication() async -> Result<Application, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.sendApplication, responseModel: Application.self)
    }
    
    func sendResponse() async -> Result<Response, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.sendResponse, responseModel: Response.self)
    }
    
    func updateProject() async -> Result<Project, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.updateProject, responseModel: Project.self)
    }

    func updateApplicant() async -> Result<Applicant, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.updateApplicant, responseModel: Applicant.self)
    }
    
    func getOffers() async -> Result<[Offer], RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.offers, responseModel: [Offer].self)
    }
    
    func getParametrizedOffers() async -> Result<[Offer], RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.parametrizedOffers, responseModel: [Offer].self)
    }
    
    func deleteApplicant() async -> Result<String, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.deleteApplicant, responseModel: String.self)
    }
    
    func deleteProject() async -> Result<String, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.deleteProject, responseModel: String.self)
    }
    
    func deleteOffer() async -> Result<String, RequestError> {
        return await sendRequest(endpoint: LavoroEndpoint.deleteOffer, responseModel: String.self)
    }
}
