//
//  UserProfile.swift
//  littlelemon
//
//  Created by Emre Ülkem on 15.04.2023.
//

import SwiftUI

struct UserView: View {
    @StateObject private var viewModel = ViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    
    @State private var isLoggedOut = false
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 5) {
                    VStack {
                        Text("Avatar")
                            .onboardingTextStyle()
                        HStack(spacing: 0) {
                            Image("profile")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxHeight: 75)
                                .clipShape(Circle())
                                .padding(.trailing)
                            Button("Change") { }
                                .buttonStyle(ButtonStylePrimaryColor1())
                            Button("Remove") { }
                                .buttonStyle(ButtonStylePrimaryColorReverse())
                            Spacer()
                        }
                    }
                    
                    VStack{
                        Text("First name")
                            .onboardingTextStyle()
                        TextField("First Name", text: $firstName)
                    }
                    
                    VStack {
                        Text("Last name")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $lastName)
                        
                    }
                    
                    VStack {
                        Text("E-mail")
                            .onboardingTextStyle()
                        TextField("E-mail", text: $email)
                            .keyboardType(.emailAddress)
                    }
                    
                    VStack {
                        Text("Phone number")
                            .onboardingTextStyle()
                        TextField("Phone number", text: $phoneNumber)
                            .keyboardType(.default)
                    }
                }
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
                
                Text("Email notifications")
                    .font(.regularText())
                    .foregroundColor(.primaryColor1)
                .padding()
                .font(Font.leadText())
                .foregroundColor(.primaryColor1)
                
                Button("Log out") {
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    UserDefaults.standard.set("", forKey: kFirstName)
                    UserDefaults.standard.set("", forKey: kLastName)
                    UserDefaults.standard.set("", forKey: kEmail)
                    UserDefaults.standard.set("", forKey: kPhoneNumber)
                    isLoggedOut = true
                }
                .buttonStyle(ButtonStyleYellowColorWide())
                Spacer(minLength: 20)
                HStack {
                    Button("Discard Changes") {
                        firstName = viewModel.firstName
                        lastName = viewModel.lastName
                        email = viewModel.email
                        phoneNumber = viewModel.phoneNumber
                        
                        self.presentation.wrappedValue.dismiss()
                    }
                    .buttonStyle(ButtonStylePrimaryColorReverse())
                    Button("Save changes") {
                        if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                            self.presentation.wrappedValue.dismiss()
                        }
                    }
                    .buttonStyle(ButtonStylePrimaryColor1())
                }
                if viewModel.errorMessageShow {
                    withAnimation() {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                    }
                }
                
            }
            .onAppear {
                firstName = viewModel.firstName
                lastName = viewModel.lastName
                email = viewModel.email
                phoneNumber = viewModel.phoneNumber
            }
            .navigationTitle(Text("Personal information"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
