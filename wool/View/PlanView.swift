//
//  PlanView.swift
//  wool
//
//  Created by xzjs on 2022/7/26.
//

import SwiftUI

struct PlanView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Plan.entity(), sortDescriptors: []) var plans : FetchedResults<Plan>
    
    var body: some View {
        NavigationView{
            List(plans){
                Text($0.name!)
            }
            .navigationTitle("计划")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink{
                        AddPlanView()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
