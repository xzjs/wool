//
//  ContentView.swift
//  wool
//
//  Created by xzjs on 2022/5/11.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        TabView{
            CardView()
                .tabItem {
                    Image(systemName: "creditcard")
                }
            AddPlanView()
                .tabItem{
                    Image(systemName: "plus")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
