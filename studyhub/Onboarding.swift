//
//  OnboardingView.swift
//  studypro2
//
//  Created by Dias Akyshev on 13.11.2024.
//

import Foundation
import SwiftUI
import CoreData

struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var isStudent: Bool = false
    @State private var password: String = ""
    @State private var wrongPassword = 0
    @State private var wrongUsername = 0
    @State private var isLoggedIn: Bool = false
    @State private var showingLoginScreen: Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7).foregroundStyle(.orange)
                Circle().scale(1.2).foregroundStyle(.white.opacity(0.6))
                VStack{
                    Text("Registration")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 360, height: 50)
                        .background(Color.white.opacity(0.7))
                        .border(.red, width: CGFloat(wrongUsername))
                        .cornerRadius(CGFloat(15))
                        .autocorrectionDisabled(true)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 360, height: 50)
                        .background(Color.white.opacity(0.7))
                        .autocorrectionDisabled(true)
                        .border(.red, width: CGFloat(wrongPassword))
                        .cornerRadius(CGFloat(15))
                    TextField("First Name", text: $firstName)
                        .padding()
                        .frame(width: 360, height: 50)
                        .background(Color.white.opacity(0.7))
                        .border(.red, width: CGFloat(wrongUsername))
                        .cornerRadius(CGFloat(15))
                        .autocorrectionDisabled(true)
                    TextField("Last name", text: $lastName)
                        .padding()
                        .frame(width: 360, height: 50)
                        .background(Color.white.opacity(0.7))
                        .border(.red, width: CGFloat(wrongUsername))
                        .cornerRadius(CGFloat(15))
                        .autocorrectionDisabled(true)
                    Toggle(isStudent ? "I am a student": "I am a teacher", isOn: $isStudent).padding().frame(width: 320)

                    Button{
                        registerUser(username: username, firstName: firstName, lastName: lastName, isStudent: isStudent)
                    } label: {
                        HStack{
                            Text(
                                "SIGN UP"
                            ).frame(width: 360, height: 50)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(.rect(cornerRadius: 15))
                        }
                    }
                        .padding()
                    }.offset(y: -100)
            }
        }
    }
    func registerUser(username: String, firstName: String, lastName: String, isStudent: Bool){
        if username.lowercased() == "dias"{
            if password == "123456"{
                
            }
        }
    }
}

#Preview {
    Onboarding()
}
