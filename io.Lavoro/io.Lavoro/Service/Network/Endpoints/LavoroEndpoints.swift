//
//  LavoroEndpoints.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 11.04.22.
//

import Foundation

enum LavoroEndpoint {
    case applicant(id: String)// get applicant full info
    case project(id: String)// get project full info
    case projects// get all projects
    case applicants// get all applicants
    case parametrizedApplicants// get list of applicants with parameters
    case parametrizedProjects// get list of projects with parameters
    case createProject(project: Project, id: String)// post project
    case createApplicant(applicant: Applicant, id: String)// post applicant
    case sendApplication// post application
    case updateApplication
    case deleteApplication
    case getApplication
    case sendResponse// post application respose
    case updateProject(project: Project)// put project
    case updateApplicant(applicant: Applicant, id: String)// put applicant
    case updateOffer// put offer
    case offers// get offers
    case parametrizedOffers// get parametrized offers
    case deleteApplicant
    case deleteProject
    case deleteOffer
    case skills
    case technology
    case offerTechnologies
    case employeeSkills
}

extension LavoroEndpoint: Endpoint {
    var path: String {
        switch self {
        case .applicant:
            return "applicant/\(CurrentUser.shared.getId())"
        case .project:
            return "project/\(CurrentUser.shared.getId())"
        case .projects:
            return "project/list"
        case .applicants:
            return "applicant/list"
        case .parametrizedApplicants:
            return "applicants/getWithParameters"
        case .parametrizedProjects:
            return "projects/getWithParameters"
        case .createProject:
            return "project/create"
        case .createApplicant:
            return "applicant/create"
        case .sendApplication:
            return "application/create"
        case .updateApplication:
            return "application/update"
        case .deleteApplication:
            return "application/delete"
        case .getApplication:
            return "application/create"
        case .sendResponse:
            return "response/send"
        case .updateProject:
            return "project/update"
        case .updateApplicant:
            return "applicant/update"
        case .updateOffer:
            return "offer/update"
        case .offers:
            return "offer/list"
        case .parametrizedOffers:
            return "offers/getWithParameters"
        case .deleteApplicant:
            return "applicant/delete"
        case .deleteProject:
            return "project/delete"
        case .deleteOffer:
            return "offer/delete"
        case .skills:
            return "skill/list"
        case .technology:
            return "technology/list"
        case .employeeSkills:
            return "skill/list"
        case .offerTechnologies:
            return "technology/list"
        }
    }

    var method: RequestMethod {
        switch self {
        case .applicant, .project, .projects, .applicants, .parametrizedOffers, .parametrizedProjects, .parametrizedApplicants, .offers, .skills, .technology, .employeeSkills, .offerTechnologies, .getApplication:
            return .get
        case .createProject, .createApplicant, .sendApplication, .sendResponse:
            return .post
        case .updateProject, .updateApplicant, .updateOffer, .updateApplication:
            return .put
        case .deleteOffer, .deleteApplicant, .deleteProject, .deleteApplication:
            return .delete
        }
    }

    var header: [String: String]? {
        let accessToken = UserDefaults.standard.string(forKey: "login") ?? ""
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
    }
    
    var body: [String: Any]? {
        switch self {
        case .applicant, .project:
            return nil
        case .projects:
            return nil
        case .applicants:
            return nil
        case .parametrizedApplicants:
            return nil
        case .parametrizedProjects:
            return nil
        case .createProject(let project, let id):
            return  [
                "user": [
                    "id": id,
                ],
                "name": project.name,
                "location": project.location,
                "category": project.category,
                "mode": project.mode,
                "description": project.description,
                "photo": "guideHuman",
            ]
        case .createApplicant(let applicant, let id):
            return  [
                "user": [
                    "id": id,
                ],
                "name": applicant.name,
                "surname": applicant.surname,
                "age": applicant.age,
                "location": applicant.location,
                "salary": applicant.payment,
                "mode": applicant.mode,
                "photo": "amy",
                "description": applicant.description,
                "relocate": applicant.relocate,
                "interests": applicant.interests,
                "specialization": applicant.specialization
            ]
        case .sendApplication:
            return [
                "reciever": "D8AE1B9A-8266-4A32-8CB2-B8848AD940BE",
                       "id": "3CA258D4-178C-4640-9D8E-776668077777",
                       "sender": [
                           "id": "3CA258D4-178C-4640-9D8E-776668079DDC"
                       ],
                       "offer": [
                           "id": "505E3AA6-B11D-43A0-8482-8E267A9432C4"
                       ],
                       "description": "йугкещцимшнфуагрфиымушкугаюлкцап"
            ]
        case .updateApplication:
            return nil
        case .deleteApplication:
            return nil
        case .getApplication:
            return nil
        case .sendResponse:
            return nil
        case .updateProject:
            return nil
        case .updateApplicant(let applicant, let id):
            return  [
                "user": [
                    "id": applicant.bufId,
                ],
                "name": applicant.name,
                "surname": applicant.surname,
                "age": applicant.age,
                "location": applicant.location,
                "salary": applicant.payment,
                "mode": applicant.mode,
                "description": applicant.description,
                "relocate": applicant.relocate,
                "interests": applicant.interests,
                "specialization": applicant.specialization,
                "skills": """
                    "[
                      "id": "6405DC34-3FE0-4C8B-B368-0198797F9745",
                          "owner": {
                               "id": "6405DC34-3FE0-4C8B-B368-0198797F9789"
                           },
                           "level": "Advanced",
                           "name": "Github"
                    ]
""",
//                "skills": [
//                        "id": "6405DC34-3FE0-4C8B-B368-0198797F9745",
//                        "owner": {
//                            "id": "6405DC34-3FE0-4C8B-B368-0198797F9789"
//                        },
//                        "level": "Advanced",
//                        "name": "Github"
//                ]
            ]
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
        case .skills:
            return nil
        case .technology:
            return nil
        case .employeeSkills:
            return nil
        case .offerTechnologies:
            return nil
        }
    }
}
