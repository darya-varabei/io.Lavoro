//
//  ApplicationListView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 14.04.22.
//

import SwiftUI

struct ApplicationListView: View {
    @State var applicationsViewModel = ApplicationViewModel()
    var body: some View {
        NavigationView {
            List(applicationsViewModel.applications, id: \.self) { application in
                NavigationLink(
                    destination: ApplicationDetailView(application: application),
                    label: { ApplicationCellView(sender: WrappedAccount(account: application.sender as! Account))
                    }
                )
            }
        }
    }
}

struct ApplicationListView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationListView()
    }
}
