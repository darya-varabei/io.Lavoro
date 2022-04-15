//
//  LavoroEndpoints.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 11.04.22.
//

import Foundation

enum LavoroEndpoint {
    case applicant// get applicant full info
    case project// get project full info
    case projects// get all projects
    case applicants// get all applicants
    case parametrizedApplicants// get list of applicants with parameters
    case parametrizedProjects// get list of projects with parameters
    case createProject// post project
    case createApplicant// post applicant
    case sendApplication// post application
    case sendResponse// post application respose
    case updateProject// put project
    case updateApplicant// put applicant
    case updateOffer// put offer
    case offers// get offers
    case parametrizedOffers// get parametrized offers
    case deleteApplicant
    case deleteProject
    case deleteOffer
}

extension LavoroEndpoint: Endpoint {
    var path: String {
        switch self {
        case .applicant:
            return "account/getInfo"
        case .project:
            return "project/getInfo"
        case .projects:
            return "projects/list"
        case .applicants:
            return "account/list"
        case .parametrizedApplicants:
            return "applicants/getWithParameters"
        case .parametrizedProjects:
            return "projects/getWithParameters"
        case .createProject:
            return "project/create"
        case .createApplicant:
            return "applicant/create"
        case .sendApplication:
            return "application/send"
        case .sendResponse:
            return "response/send"
        case .updateProject:
            return "project/update"
        case .updateApplicant:
            return "applicant/update"
        case .updateOffer:
            return "offer/update"
        case .offers:
            return "offers/list"
        case .parametrizedOffers:
            return "offers/getWithParameters"
        case .deleteApplicant:
            return "applicant/delete"
        case .deleteProject:
            return "project/delete"
        case .deleteOffer:
            return "offer/delete"
        }
    }

    var method: RequestMethod {
        switch self {
        case .applicant, .project, .projects, .applicants, .parametrizedOffers, .parametrizedProjects, .parametrizedApplicants, .offers:
            return .get
        case .createProject, .createApplicant, .sendApplication, .sendResponse:
            return .post
        case .updateProject, .updateApplicant, .updateOffer:
            return .put
        case .deleteOffer, .deleteApplicant, .deleteProject:
            return .delete
        }
    }

    var header: [String: String]? {
        // Access Token to use in Bearer header
        let accessToken = "insert your access token here -> https://www.themoviedb.org/settings/api"
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
    }
    
    var body: [String: String]? {
        switch self {
        case .applicant, .project, .projects:
            return nil
        case .applicants:
            return nil
        case .parametrizedApplicants:
            return nil
        case .parametrizedProjects:
            return nil
        case .createProject:
            return nil
        case .createApplicant:
            return nil
        case .sendApplication:
            return nil
        case .sendResponse:
            return nil
        case .updateProject:
            return nil
        case .updateApplicant:
            return nil
        case .offers:
            return nil
        case .parametrizedOffers:
            return nil
        case .deleteApplicant:
            return nil
        case .deleteProject:
            return nil
        case .deleteOffer:
            return nil
        case .updateOffer:
            return nil
        }
    }
}
