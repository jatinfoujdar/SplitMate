//
//  SignInView.swift
//  SplitMate
//
//  Created by jatin foujdar on 23/10/25.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    // MARK: - State
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @FocusState private var focusedField: Field?
    
    // MARK: - Rive Model
    // No loop parameter in new API
    @State private var riveModel = RiveViewModel(fileName: "teste-para-login", autoPlay: true)
    
    private enum Field { case email, password }
    
    // MARK: - View
    var body: some View {
        ZStack {
            // Background animation
            riveModel.view()
                .frame(width: 300, height: 400)
                .scaleEffect(0.8)
                .allowsHitTesting(false)
            
            VStack(spacing: 32) {
                Spacer()
                
                // Title
                VStack(spacing: 8) {
                    Image(systemName: "checklist")
                        .font(.system(size: 56, weight: .thin))
                        .foregroundColor(.accentColor)
                    
                    Text("IconicList")
                        .font(.largeTitle.bold())
                        .foregroundColor(.primary)
                }
                
                // Form
                VStack(spacing: 20) {
                    // Email
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
                    .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
                    
                    // Password
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.secondary)
                        
                        Group {
                            if isPasswordVisible {
                                TextField("Password", text: $password)
                                    .textContentType(.password)
                            } else {
                                SecureField("Password", text: $password)
                                    .textContentType(.password)
                            }
                        }
                        .focused($focusedField, equals: .password)
                        
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isPasswordVisible.toggle()
                            }
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            
                            // Optional animation call
                            riveModel.play(animationName: "eyeToggle")
                        } label: {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.secondary)
                                .padding(.leading, 8)
                        }
                        .accessibilityLabel(isPasswordVisible ? "Hide password" : "Show password")
                    }
                    .padding()
                    .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
                    
                    // Sign In
                    Button {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        signIn()
                        riveModel.play(animationName: "success")
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
                
                Spacer()
                
                Text("Secure • Fast • Yours")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                focusedField = .email
            }
        }
        .background(
            LinearGradient(
                colors: [Color(.systemBackground), Color(.secondarySystemBackground)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
    
    // MARK: - Actions
    private func signIn() {
        print("Signing in with email: \(email)")
        // TODO: add authentication logic here
    }
}

// MARK: - Preview
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInView()
                .preferredColorScheme(.light)
            SignInView()
                .preferredColorScheme(.dark)
        }
    }
}
