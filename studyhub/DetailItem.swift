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
            HStack {
                Text(challenge.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.sectionCategories())
                    .foregroundColor(.black)
                Spacer(minLength: 10)
                Text(challenge.descriptionTask ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.paragraphText())
                    .foregroundColor(.primaryColor1)
                    .lineLimit(2)
                Spacer(minLength: 5)
                Text("Rating" + (challenge.rating ?? ""))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
                    .monospaced()
            }
            AsyncImage(url: URL(string: challenge.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
    }

}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        DetailItem(challenge: PersistenceController.oneTask())
    }
}
