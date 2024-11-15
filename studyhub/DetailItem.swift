//
//  DetailItem.swift
//  studyhub
//
//  Created by Dias Akyshev on 15.11.2024.

import SwiftUI

struct DetailItem: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let challenge: Item
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: challenge.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            Text(challenge.title ?? "")
                .font(.subTitleFont())
                .foregroundColor(.primaryColor1)
            Spacer(minLength: 20)
            Text(challenge.descriptionTask ?? "")
                .font(.regularText())
            Spacer(minLength: 10)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        DetailItem(challenge: PersistenceController.oneTask())
    }
}
