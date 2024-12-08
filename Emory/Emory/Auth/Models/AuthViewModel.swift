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
            self?.errorHandling(error)
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] _, error in
            self?.errorHandling(error)
        }
    }
    
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            self.errorHandling(error)
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
            self.errorMessage = nil
        } catch {
            self.errorMessage = self.createErrormessageFromAuth(error)
        }
    }
    
    private func errorHandling(_ error: Error?) {
        guard let error = error else {
            self.errorMessage = nil
            return
        }

        self.errorMessage = self.createErrormessageFromAuth(error)
    }
    
    private func createErrormessageFromAuth(_ error: Error) -> String {
        let nsError = error as NSError
        
        if let authErrorCode = AuthErrorCode(rawValue: nsError.code) {
            
            switch authErrorCode {
            case .userNotFound:
                return "メールアカウントが見つかりません"
            case .invalidEmail:
                return "メールアドレスが正しくありません"
            case .userDisabled:
                return "メールアカウントが無効になっています"
            case .wrongPassword:
                return "パスワードが間違っています"
            case .emailAlreadyInUse:
                return "メールアカウントが既に登録されています。必要に応じてパスワードリセットを試みてください"
            case .weakPassword:
                return "パスワードは8文字以上で、大文字と小文字を含めてください"
            case .operationNotAllowed:
                return "メールアドレスとパスワードを使用するアカウントが有効ではありません"
            case .networkError:
                return "ネットワークエラー"
            default:
                return "unknownError"
            }
        } else {
            return "unknownError"
        }
    }
}
