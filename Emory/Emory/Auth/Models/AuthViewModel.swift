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
    @Published var errorMessage: String?
    
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
            if let error = error {
                self?.errorMessage = self?.createErrormessageFromSignIn(error)
            } else {
                self?.isAuthenticated = true
                self?.errorMessage = nil
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
    
    private func createErrormessageFromSignIn(_ error: Error) -> String {
        let nsError = error as NSError
        
        if let authErrorCode = AuthErrorCode(rawValue: nsError.code) {
            
            switch authErrorCode {
            case .invalidEmail:
                return "メールアドレスが正しくありません"
            case .userDisabled:
                return "メールアカウントが無効になっています"
            case .wrongPassword:
                return "パスワードが間違っています"
            default:
                return "unknownError"
            }
        } else {
            return "unknownError"
        }
    }
}
