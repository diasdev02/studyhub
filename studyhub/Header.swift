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
                    Image("Logo")
                    HStack {
                        Spacer()
                        if isLoggedIn {
                            NavigationLink(destination: UserView()) {
                                Image("profile")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(maxHeight: 50)
                                    .clipShape(Circle())
                                    .padding(.trailing)
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

#Preview {
    Header()
}
