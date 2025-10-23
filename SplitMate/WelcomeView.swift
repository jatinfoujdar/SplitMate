//
//  WelcomeView.swift
//  SplitMate
//
//  Created by jatin foujdar on 23/10/25.
//

import SwiftUI

struct WelcomeView: View {
//    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(
                    colors: [Color.primaryColor, Color.primaryDark],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    VStack(spacing: 24) {
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 96, height: 96)
                            Image(systemName: "person.2.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                                .foregroundColor(.textInverse)
                        }
                        
                        Text("SplitWise")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(.textInverse)
                            .padding(.bottom, 12)
                        
                        Text("Split expenses with friends and family")
                            .font(.system(size: 18))
                            .foregroundColor(.textInverse.opacity(0.9))
                            .multilineTextAlignment(.center)
                            .lineSpacing(6)
                    }
                    .padding(.top)
                    
                    Spacer()
                    
                    // Features
                    VStack(alignment: .leading ,spacing: 20) {
                        FeatureItem(title: "Track expenses", description: "Keep track of all shared expenses")
                        FeatureItem(title: "Split bills", description: "Split bills easily with multiple people")
                        FeatureItem(title: "Settle up", description: "Know exactly who owes what")
                    }
                    
                    Spacer()
                    
                    // Buttons
                    VStack(spacing: 16) {
                        NavigationLink(destination: SignupView()) {
                            HStack(spacing: 8) {
                                Text("Get Started")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.primaryColor)
                                
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.primaryColor)
                            }
                            .padding(.vertical, 18)
                            .padding(.horizontal, 32)
                            .background(Color.textInverse)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                        NavigationLink(destination: SigninView()) {
                            Text("Already have an account? Sign In")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.textInverse)
                                .padding(.vertical, 16)
                        }
                    }
                    .padding(.bottom, 40)
                    .padding(.horizontal, 24)
                }
            }
        }
    }
}

struct FeatureItem: View {
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Circle()
                .fill(Color.textInverse)
                .frame(width: 8, height: 8)
                .offset(y: 6)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.textInverse)
                
                Text(description)
                    .font(.system(size: 15))
                    .foregroundColor(.textInverse.opacity(0.85))
                    .lineSpacing(4)
            }
        }
    }
}

// Colors extension
extension Color {
    static let primaryColor = Color(red: 0.2, green: 0.5, blue: 0.8)
    static let primaryDark = Color(red: 0.15, green: 0.9, blue: 0.7)
    static let textInverse = Color.white
}


struct SignupView: View {
    var body: some View {
        Text("Signup View")
    }
}

struct SigninView: View {
    var body: some View {
        Text("Signin View")
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
        }
    }
}
