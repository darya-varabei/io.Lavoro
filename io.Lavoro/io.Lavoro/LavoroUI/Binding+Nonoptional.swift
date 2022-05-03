//
//  Binding+Nonoptional.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 3.05.22.
//

import SwiftUI

extension Binding where Value == Account? {
    func toNonOptional() -> Binding<Account> {
        return Binding<Account>(
            get: {
                return self.wrappedValue!
            },
            set: {
                self.wrappedValue = $0
            }
        )
    }
}

extension Binding where Value == Applicant? {
    func toNonOptional() -> Binding<Applicant> {
        return Binding<Applicant>(
            get: {
                return self.wrappedValue!
            },
            set: {
                self.wrappedValue = $0
            }
        )
    }
}

extension Binding where Value == Project? {
    func toNonOptional() -> Binding<Project> {
        return Binding<Project>(
            get: {
                return self.wrappedValue!
            },
            set: {
                self.wrappedValue = $0
            }
        )
    }
}
