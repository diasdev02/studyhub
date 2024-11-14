//
//  Login.swift
//  studyhub
//
//  Created by Dias Akyshev on 13.11.2024.
//

import Foundation
import SwiftUI

struct Login: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    var body: some View{
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
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 360, height: 50)
                        .background(Color.white.opacity(0.7))
                        .border(.red, width: CGFloat(wrongPassword))
                        .cornerRadius(CGFloat(15))
                    Text(
                            "SIGN IN"
                        ).padding()
                }
            }
        }
    }
}


#Preview {
    Login()
}
