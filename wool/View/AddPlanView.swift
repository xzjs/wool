//
//  AddPlanView.swift
//  wool
//
//  Created by xzjs on 2022/5/11.
//

import SwiftUI

struct AddPlanView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var card:Card?
    @State private var start = Date()
    @State private var end = Date()
    @State private var total:NSDecimalNumber?
    @State private var units:Units = .Day
    @State private var frequency = 1
    @FetchRequest(sortDescriptors: []) var cards:FetchedResults<Card>
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("活动名称")){
                    TextField("活动名称",text: $name)
                }
                Section(header: Text("卡片")){
                    Picker("卡片",selection: $card){
                        ForEach(cards){item in
                            Text(item.name!)
                                .tag(item as Card?)
                        }
                    }
                }
                Section(header: Text("起止时间")){
                    DatePicker("开始时间",selection: $start,displayedComponents: [.date])
                    DatePicker("结束时间",selection: $end,displayedComponents: [.date])
                }
                Section(header: Text("消费总额")){
                    TextField("消费总额",value: $total,formatter: NumberFormatter())
                }
                Section(header: Text("频率")){
                    TextField("频率",value:$frequency,formatter: NumberFormatter())
                    Picker("单位",selection: $units){
                        ForEach(Units.allCases){value in
                            Text(value.rawValue)
                        }
                    }
                }
                
                Section(){
                    Button("保存"){
                        let plan = Plan(context: moc)
                        plan.name=name
                        plan.card = card
                        plan.start = start
                        plan.end = end
                        plan.total = total
                        plan.frequency = Int16(frequency)
                        plan.units = units.rawValue
                        try? moc.save()
                        dismiss()
                    }
                }
            }
        }
    }
    
}

struct AddPlanView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.shared
        AddPlanView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
