//
//  Literals.swift
//  io.Lavoro
//
//  Created by Дарья Воробей on 7.03.22.
//

import Foundation
import SwiftUI

enum Literals: String {
    case logInText = "Вход в аккаунт"
    case enterData = "Введите данные учетной записи"
    case email = "Эл.почта"
    case password = "Пароль"
    case enter = "Войти"
    case forgotPassword = "Забыли пароль?"
    case noAccount = "Еще нет аккаунта?"
    case register = "Зарегистрируйтесь"
    case facebookText = "Войти через Facebook"
}

extension Color {
    static let customWhite = Color("white")
    static let primaryBlue = Color("primaryBlue")
    static let darkBlue = Color("darkBlue")
}

enum Images: String {
    case lock = "lock"
    case envelope = "envelope"
    case faceid = "faceid"
    case touchid = "touchid"
    case facebookIcon = "facebookIcon"
    case logo = "logo"
}
