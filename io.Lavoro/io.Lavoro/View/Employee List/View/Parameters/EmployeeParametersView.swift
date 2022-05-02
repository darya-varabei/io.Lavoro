//
//  EmployeeParametersView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 27.03.22.
//

import SwiftUI

struct EmployeeParametersView: View {
    @State var employeeModel: EmployeeViewModel = EmployeeViewModel()
    @Binding var slideOverViewPosition: ViewPosition
    @State var mode: RoleMode
    @State var employeeParameters = EmployeeParameters(mode: .employee)
    
    @State var selectedName = ""
    @State var selectedLevel = ""
    @State var parameterSkills: [Skill] = []
    @State var selectedLanguages:[String] = []

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !employeeModel.isParametersOpen {
                VStack(alignment: .leading) {
                    HStack {
                        Button(action: {
                            slideOverViewPosition = .hidden
                            employeeParameters.performFiltration(offers: employeeModel.applicants)
                        }, label: {
                            Text("Закрыть параметры")
                                .underline()
                                .foregroundColor(.customBlack.opacity(0.8))
                                .font(.custom("Montserrat-Medium", size: 14))
                        })
                        Spacer()
                        Text("")
                    }.padding(.bottom, 20)
                    
                    VStack(alignment: .leading) {
                        Text("Выберите навык")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(employeeParameters.skills, id: \.self) { skill in
                                    ZStack{
                                                                            RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(selectedName == skill ?  .darkBlue.opacity(0.3) : .customWhite)
                                                                                .padding(.vertical, 8)
                                                                                .padding(.horizontal, 10)
                                        Text(skill)
                                            .font(.custom("Montserrat-Medium", size: 12))
                                            .foregroundColor(.darkBlue)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 40)
                                            .clipShape(Capsule())
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.primaryBlue.opacity(0.5), lineWidth: 1)
                                                    .foregroundColor(.clear)
                                            )
                                    }.onTapGesture {
                                        selectedName = skill
                                    }
                                }.padding(.vertical, 15)
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Выберите уровень")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(employeeParameters.levels, id: \.self) { level in
                                    ZStack{
                                                                            RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(selectedLevel == level ? .darkBlue.opacity(0.3) : .customWhite)
                                                                                .padding(.vertical, 8)
                                                                                .padding(.horizontal, 40)
                                        Text(level)
                                            .font(.custom("Montserrat-Medium", size: 12))
                                            .foregroundColor(.darkBlue)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 40)
                                            .clipShape(Capsule())
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.primaryBlue.opacity(0.5), lineWidth: 1)
                                                    .foregroundColor(.clear)
                                            )
                                    }.onTapGesture {
                                        selectedLevel = level
                                    }
                                }.padding(.vertical, 15)
                            }
                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor((selectedName == "" || selectedLevel == "") ? .green : .darkBlue)
                            .frame(width: UIScreen.main.bounds.width - 300, height: 44, alignment: .center)
                        Button(action: {
                            parameterSkills.append(Skill(name: selectedName, level: selectedLevel))
                            selectedName = ""
                            selectedLevel = ""
                        }, label: {
                            Text("Сохранить")
                                .font(.custom("Montserrat-Medium", size: 12))
                                .foregroundColor(.customWhite)
                                .frame(width: UIScreen.main.bounds.width - 300)
                                .clipShape(Capsule())
                        }).disabled(selectedName == "" || selectedLevel == "")
                    }.padding(.vertical, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(parameterSkills, id: \.self) { skill in
                                VStack {
                                    Text(skill.name)
                                        .font(.custom("Montserrat-Medium", size: 12))
                                        .foregroundColor(.darkBlue)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 10)
                                        .clipShape(Capsule())
                                    Text(skill.level)
                                        .font(.custom("Montserrat-Medium", size: 12))
                                        .foregroundColor(.darkBlue)
                                        .padding(.bottom, 8)
                                        .padding(.horizontal, 10)
                                        .clipShape(Capsule())
                                }.overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.primaryBlue.opacity(0.5), lineWidth: 1)
                                )
                            }
                        }
                    }.padding(.bottom, 30)
                    HStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Выберите страну")
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(.black)
                            
                            Menu {
                                ForEach(employeeParameters.countries, id: \.self) { client in
                                    Button(client) {
                                        employeeParameters.selectedCountry = client
                                    }
                                }
                            } label: {
                                VStack(spacing: 5){
                                    HStack{
                                        Text( employeeParameters.selectedCountry.isEmpty ? employeeParameters.countryPlaceholder :  employeeParameters.selectedCountry)
                                            .foregroundColor( employeeParameters.selectedCountry.isEmpty ? .gray : .black)
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.primaryBlue.opacity(0.4))
                                            .font(Font.system(size: 20, weight: .bold))
                                    }
                                    .padding(.horizontal)
                                    Rectangle()
                                        .fill(Color.primaryBlue.opacity(0.4))
                                        .frame(height: 2)
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Выберите город")
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(.black)
                            
                            Menu {
                                ForEach(employeeParameters.cities, id: \.self) { client in
                                    Button(client) {
                                        employeeParameters.selectedCity = client
                                    }
                                }
                            } label: {
                                VStack(spacing: 5){
                                    HStack{
                                        Text(employeeParameters.selectedCity.isEmpty ? employeeParameters.cityPlaceholder : employeeParameters.selectedCity)
                                            .foregroundColor(employeeParameters.selectedCity.isEmpty ? .gray : .black)
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.primaryBlue.opacity(0.4))
                                            .font(Font.system(size: 20, weight: .bold))
                                    }
                                    .padding(.horizontal)
                                    Rectangle()
                                        .fill(Color.primaryBlue.opacity(0.4))
                                        .frame(height: 2)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Toggle(isOn: $employeeParameters.relocateSupport) {
                            Text("Релокейт")
                                .font(.custom("Montserrat-Medium", size: 14))
                                .foregroundColor(.black)
                        }
                        .toggleStyle(LavoroCheckBox())
                        .padding(.vertical, 30)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Выберите языки общения")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.black)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(employeeParameters.languages, id: \.self) { language in
                                    ZStack{
                                        //                                    RoundedRectangle(cornerRadius: 15)
                                        //                                        .foregroundColor(selectedLevel == level ? .darkBlue.opacity(0.3) : .customWhite)
                                        //                                        .padding(.vertical, 8)
                                        //                                        .padding(.horizontal, 40)
                                        Text(language)
                                            .font(.custom("Montserrat-Medium", size: 12))
                                            .foregroundColor(.darkBlue)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 40)
                                            .clipShape(Capsule())
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.primaryBlue.opacity(0.5), lineWidth: 1)
                                                    .foregroundColor(selectedLanguages.contains(language) ? .darkBlue.opacity(0.3) : .customWhite)
                                            )
                                    }.onTapGesture {
                                        selectedLanguages.append(language)
                                    }
                                }.padding(.vertical, 15)
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("Заработная плата($)")
                            .font(.custom("Montserrat-Medium", size: 14))
                            .foregroundColor(.black)
                        HStack {
                            HStack {
                                Text("от")
                                    .font(.custom("Montserrat-Medium", size: 12))
                                    .foregroundColor(.black)
                                TextField("", text: $employeeParameters.minimalSalary)
                                    .textFieldStyle(GHRoundedTextFieldStyle(textColor: .customBlack, cornerRadius: 5, borderColor: .customBlack.opacity(0.5)))
                            }
                            
                            HStack {
                                Text("до")
                                    .font(.custom("Montserrat-Medium", size: 12))
                                    .foregroundColor(.black)
                                TextField("", text: $employeeParameters.maximalSalary)
                                    .textFieldStyle(GHRoundedTextFieldStyle(textColor: .customBlack, cornerRadius: 5, borderColor: .customBlack.opacity(0.5)))
                            }
                        }.padding(.trailing, 100)
                    }
                    Button(action: {
                    }, label: {
                        Text("Подобрать")
                            .font(.custom("Montserrat-Medium", size: 12))
                            .foregroundColor(.customWhite)
                            .frame(width: UIScreen.main.bounds.width - 300)
                            .clipShape(Capsule())
                    })
                    .padding(.bottom, 180)
                }.padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .background(Color.clear)
            }
        }
    }
}

