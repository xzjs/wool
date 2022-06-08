//
//  AddBankView.swift
//  wool
//
//  Created by xzjs on 2022/5/11.
//

import SwiftUI

struct AddCardView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var name = ""
    @State private var no = ""
    let banks:[String] = ["广发银行","交通银行","平安银行","浦发银行","招商银行","中国光大银行","中国民生银行","中国农业银行","中国银行"]
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("选择银行",selection: $name){
                        ForEach(banks,id:\.self){item in
                            HStack{
                                Image(item)
                                Text(item)
                            }
                        }
                    }
                    TextField("卡号后4位",text: $no)
                }
                Section{
                    Button("保存"){
                        let card = Card(context:moc)
                        card.name = name
                        card.no = no
                        try? moc.save()
                    }
                }
            }
        }
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.shared
        AddCardView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
