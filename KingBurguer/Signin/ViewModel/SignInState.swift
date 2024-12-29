//
//  SignInState.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//

import Foundation

enum SignInState {
    case none
    case loading
    case goToHome
    case error(String)
}
