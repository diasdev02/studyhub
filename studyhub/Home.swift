//
//  Home.swift
//  studyhub
//
//  Created by Dias Akyshev on 13.11.2024.
//

import Foundation
import SwiftUI

struct Home: View{
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationStack {
            VStack {
                Header()
                MainPage()
            }
        }
    }
}
