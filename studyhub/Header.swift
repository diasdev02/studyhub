//
//  Header.swift
//  studyhub
//
//  Created by Dias Akyshev on 14.11.2024.
//

import SwiftUI

struct Header: View {
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                        HStack {
                        Spacer()
                        if isLoggedIn {
                            Image("Logo")
                                .scaledToFit()
                                .frame(height: 100)
                            NavigationLink(destination: UserView()) {
                                Image("Profile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40, alignment: .trailing)
                                    .clipShape(Circle())
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
        .frame(maxHeight: 50)
        
        .onAppear() {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            } else {
                isLoggedIn = false
            }
        }
    }
}
 
struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
