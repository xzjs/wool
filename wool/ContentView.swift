//
//  ContentView.swift
//  wool
//
//  Created by xzjs on 2022/5/11.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        TabView{
            CardView()
                .tabItem {
                    Image(systemName: "creditcard")
                }
            PlanView()
                .tabItem{
                    Image(systemName: "checkmark.square")
                }
            IndexView()
                .tabItem{
                    Image(systemName:"house")
                }
            ReportView()
                .tabItem{
                    Image(systemName: "clock")
                }
            MineView()
                .tabItem{
                    Image(systemName: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.shared
        ContentView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
