//
//  MainPage.swift
//  studyhub
//
//  Created by Dias Akyshev on 15.11.2024.
//

import SwiftUI

struct MainPage: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var mathIsEnabled = true
    @State var literatureIsEnabled = true
    @State var thirdTypeIsEnabled = true
    @State var gaussIsEnabled = true
    
    @State var searchText = ""
    
    @State var loaded = false
    
    @State var isKeyboardVisible = false
    
    init() {
        UITextField.appearance().clearButtonMode = .whileEditing
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search menu", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                }
                .padding()
                .background(Color.primaryColor1)
                
                Text("ORDER FOR DELIVERY!")
                    .font(.sectionTitle())
                    .foregroundColor(.highlightColor2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        Toggle("Mathematics", isOn: $mathIsEnabled)
                        Toggle("Literature", isOn: $literatureIsEnabled)
                        Toggle("Third Type", isOn: $thirdTypeIsEnabled)
                        Toggle("Gauss Formula", isOn: $gaussIsEnabled)
                    }
                    .toggleStyle(MyToggleStyle())
                    .padding(.horizontal)
                }
                FetchedObjects(predicate: buildPredicate(),
                               sortDescriptors: buildSortDescriptors()) {
                    (tasks: [Item]) in
                    List(tasks) { item in
                        NavigationLink(destination: DetailItem(challenge: item)) {
                            DetailItem(challenge: item)
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
        .onAppear {
            if !loaded {
                MenuList.getMenuData(viewContext: viewContext)
                loaded = true
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = true
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = false
            }
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                 ascending: true,
                                 selector:
                                    #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSCompoundPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let math = !mathIsEnabled ? NSPredicate(format: "category != %@", "math") : NSPredicate(value: true)
        let literature = !literatureIsEnabled ? NSPredicate(format: "category != %@", "literature") : NSPredicate(value: true)
        let thirdtype = !thirdTypeIsEnabled ? NSPredicate(format: "category != %@", "thirdtype") : NSPredicate(value: true)
        let gauss = !gaussIsEnabled ? NSPredicate(format: "category != %@", "Gauss's Law") : NSPredicate(value: true)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
    }

}

#Preview {
    MainPage()
}
