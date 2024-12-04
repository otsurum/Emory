//
//  AuthViewModel.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/12/04.
//

import FirebaseAuth
import Foundation

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    
    init() {
        observeAuthChanges()
    }
    
    private func observeAuthChanges() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.isAuthenticated = user != nil
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let result = result else { return }
            guard let error = error else {
                self?.isAuthenticated = true
                return
            }
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let result = result else { return }
            guard let error = error else {
                self?.isAuthenticated = true
                return
            }
        }
    }
    
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            guard let error = error else {
                return
            }
            
            // resetのエラー処理
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
        } catch let signOutError as NSError {
            // NSError発生時の処理
        }
    }
}
