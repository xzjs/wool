//
//  AddPlanView.swift
//  wool
//
//  Created by xzjs on 2022/5/11.
//

import SwiftUI

struct AddPlanView: View {
    @Environment(\.managedObjectContext) var viewContext
    @State private var name = ""
    @State private var cardID = ""
    @FetchRequest(sortDescriptors: []) var cards:FetchedResults<Card>
    
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("活动名称",text: $name)
                    Picker("选择卡片",selection: $cardID){
                        ForEach(cards){item in
                            HStack{
                                Image(item.name!)
                                Text(item.name!)
                                Text(item.no!)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct AddPlanView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlanView()
    }
}
