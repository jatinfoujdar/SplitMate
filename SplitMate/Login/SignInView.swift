//
//  SignInView.swift
//  SplitMate
//
//  Created by jatin foujdar on 23/10/25.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?
    
    private enum Field { case email, password }
    
    var body: some View {
        ZStack {
            // Subtle gradient background
            LinearGradient(
                colors: [Color(.systemBackground), Color(.secondarySystemBackground)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 32) {
                Spacer()
                
                // App Logo / Title
                VStack(spacing: 8) {
                    Image(systemName: "checklist")
                        .font(.system(size: 56, weight: .thin))
                        .foregroundColor(.accentColor)
                    
                    Text("IconicList")
                        .font(.largeTitle.bold())
                        .foregroundColor(.primary)
                }
                
                // Sign-in Card
                VStack(spacing: 20) {
                    // Email Field
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.secondary)
                        TextField("Email", text: $email)
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .focused($focusedField, equals: .email)
                    }
                    .padding()
                    .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    
                    // Password Field
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.secondary)
                        SecureField("Password", text: $password)
                            .textContentType(.password)
                            .focused($focusedField, equals: .password)
                    }
                    .padding()
                    .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    
                    // Sign In Button
                    Button {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        // Handle sign in
                        signIn()
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                Color.accentColor
                                    .cornerRadius(12)
                                    .shadow(color: .accentColor.opacity(0.3), radius: 8, y: 4)
                            )
                    }
                    .disabled(email.isEmpty || password.isEmpty)
                    .opacity(email.isEmpty || password.isEmpty ? 0.6 : 1.0)
                }
                .padding(.horizontal, 32)
                .animation(.easeInOut, value: email.isEmpty || password.isEmpty)
                
                Spacer()
                
                // Footer
                Text("Secure • Fast • Yours")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .onAppear {
            // Optional: Auto-focus email on load
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                focusedField = .email
            }
        }
    }
    
    private func signIn() {
        // Add your auth logic here
        print("Signing in with: \(email)")
    }
}

// MARK: - Preview
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        
            SignInView()
                .preferredColorScheme(.dark)
        
    }
}
