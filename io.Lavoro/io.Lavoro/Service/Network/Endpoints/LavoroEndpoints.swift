//
//  LavoroEndpoints.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 11.04.22.
//

import Foundation

enum LavoroEndpoint {
    case applicant
    case project
    case projects
}

extension LavoroEndpoint: Endpoint {
    var path: String {
        switch self {
        case .applicant:
            return "account/getInfo"
        case .project:
            return "account/getInfo"
        case .projects:
            return "projects/list"
        }
    }

    var method: RequestMethod {
        switch self {
        case .applicant, .project, .projects:
            return .get
        }
    }

    var header: [String: String]? {
        // Access Token to use in Bearer header
        let accessToken = "insert your access token here -> https://www.themoviedb.org/settings/api"
        switch self {
        case .applicant, .project, .projects:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .applicant, .project, .projects:
            return nil
        }
    }
}
