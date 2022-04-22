//
//  EmployeeParametersView.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 27.03.22.
//

import SwiftUI

struct EmployeeParametersView: View {
    //@EnvironmentObject var employeeModel: EmployeeViewModel = EmployeeViewModel()
    @State var employeeModel: EmployeeViewModel = EmployeeViewModel()
    @Binding var slideOverViewPosition: ViewPosition
    @State var skills: [String] = ["C#", "WPF", "Swift", "Gitlab", "Python", "C++"]
    @State var levels: [String] = ["Beginner", "Junior", "Average", "Advanced", "Professional"]
    @State var selectedName: String = ""
    @State var selectedLevel: String = ""
    @State var parameterSkills: [Skill] = []
    @State var value = ""
    @State var relocateSupport = false
    var countryPlaceholder = "Не указана"
    var cityPlaceholder = "Не указан"
    var countries = ["PSO", "PFA", "AIR", "HOT"]
    var cities = ["PSO", "PFA", "AIR", "HOT"]
    
    @State var languages: [String] = ["Русский", "Английский", "Немецкий", "Итальянский", "Украинский"]
    @State var selectedLanguages: [String] = []
    var body: some View {
        if !employeeModel.isParametersOpen {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        slideOverViewPosition = .hidden
                    }, label: {
                        Text("Закрыть параметры")
                            .underline()
                            .foregroundColor(.customBlack.opacity(0.8))
                            .font(.custom("Montserrat-Medium", size: 14))
                    })
                    Spacer()
                    Text("")
                }//.padding(.horizontal, 30)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    Text("Выберите навык")
                        .font(.custom("Montserrat-Medium", size: 14))
                        .foregroundColor(.black)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(skills, id: \.self) { skill in
                                ZStack{
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .foregroundColor(selectedName == skill ?  .darkBlue.opacity(0.3) : .customWhite)
//                                        .padding(.vertical, 8)
//                                        .padding(.horizontal, 40)
                                    Text(skill)
                                        .font(.custom("Montserrat-Medium", size: 12))
                                        .foregroundColor(.darkBlue)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 40)
                                        .clipShape(Capsule())
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.primaryBlue.opacity(0.5), lineWidth: 1)
                                                .foregroundColor(selectedName == skill ?  .darkBlue.opacity(0.3) : .customWhite)
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
                            ForEach(levels, id: \.self) { level in
                                ZStack{
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .foregroundColor(selectedLevel == level ? .darkBlue.opacity(0.3) : .customWhite)
//                                        .padding(.vertical, 8)
//                                        .padding(.horizontal, 40)
                                    Text(level)
                                        .font(.custom("Montserrat-Medium", size: 12))
                                        .foregroundColor(.darkBlue)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 40)
                                        .clipShape(Capsule())
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.primaryBlue.opacity(0.5), lineWidth: 1)
                                                .foregroundColor(selectedLevel == level ? .darkBlue.opacity(0.3) : .customWhite)
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
                        .foregroundColor(.darkBlue)
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
                            ForEach(countries, id: \.self){ client in
                                Button(client) {
                                    self.value = client
                                }
                            }
                        } label: {
                            VStack(spacing: 5){
                                HStack{
                                    Text(value.isEmpty ? countryPlaceholder : value)
                                        .foregroundColor(value.isEmpty ? .gray : .black)
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
                            ForEach(cities, id: \.self){ client in
                                Button(client) {
                                    self.value = client
                                }
                            }
                        } label: {
                            VStack(spacing: 5){
                                HStack{
                                    Text(value.isEmpty ? cityPlaceholder : value)
                                        .foregroundColor(value.isEmpty ? .gray : .black)
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
                Toggle(isOn: $relocateSupport) {
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
                            ForEach(languages, id: \.self) { language in
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
            }.padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color.clear)
        }
    }
}

//struct EmployeeParametersView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmployeeParametersView()
//    }
//}
