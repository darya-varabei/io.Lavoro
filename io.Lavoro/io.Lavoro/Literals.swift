//
//  Literals.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation
import SwiftUI

enum Literals {
    static let logInText = "Вход в аккаунт"
    static let enterData = "Введите данные учетной записи"
    static let email = "Эл.почта"
    static let password = "Пароль"
    static let enter = "Войти"
    static let forgotPassword = "Забыли пароль?"
    static let noAccount = "Еще нет аккаунта?"
    static let register = "Зарегистрируйтесь"
    static let facebookText = "Войти через Facebook"
    
    enum OfferDescripttion {
        static let description = "Описание"
    }
    
    enum OfferDetail {
        static let salary = "З/п:"
        static let aboutProject = "О проекте"
    }
}

extension Color {
    static let customWhite = Color("white")
    static let primaryBlue = Color("primaryBlue")
    static let darkBlue = Color("darkBlue")
    static let customBlack = Color("customBlack")
}

enum Images: String {
    case lock = "lock"
    case envelope = "envelope"
    case faceid = "faceid"
    case touchid = "touchid"
    case facebookIcon = "facebookIcon"
    case logo = "logo"
    case chevronLeft = "chevron.left"
}
