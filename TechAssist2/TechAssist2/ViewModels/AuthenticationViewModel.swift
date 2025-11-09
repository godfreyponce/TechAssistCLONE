//
//  AuthenticationViewModel.swift
//  TechAssist2
//
//  Authentication View Model
//

import Foundation
import Combine
import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var userEmail: String?
    @Published var userName: String?
    
    private let authService = AuthService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Observe authentication state
        authService.$isAuthenticated
            .receive(on: DispatchQueue.main)
            .assign(to: \.isAuthenticated, on: self)
            .store(in: &cancellables)
        
        authService.$userEmail
            .receive(on: DispatchQueue.main)
            .assign(to: \.userEmail, on: self)
            .store(in: &cancellables)
        
        authService.$userName
            .receive(on: DispatchQueue.main)
            .assign(to: \.userName, on: self)
            .store(in: &cancellables)
        
        authService.$isLoading
            .receive(on: DispatchQueue.main)
            .assign(to: \.isLoading, on: self)
            .store(in: &cancellables)
        
        authService.$errorMessage
            .receive(on: DispatchQueue.main)
            .assign(to: \.errorMessage, on: self)
            .store(in: &cancellables)
    }
    
    func login() {
        authService.login()
    }
    
    func logout() {
        authService.logout()
    }
}
