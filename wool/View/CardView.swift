//
//  CardView.swift
//  wool
//
//  Created by xzjs on 2022/5/11.
//

import SwiftUI

struct CardView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Card.entity(), sortDescriptors: []) var cards : FetchedResults<Card>
    
    var body: some View {
        NavigationView{
            List(cards){item in
                HStack{
                    Image(item.name!)
                    Text(item.name!)
                    Text(item.no!)
                    Text(item.remark!)
                }
            }
            .navigationTitle("账户")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink{
                        AddCardView()
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.shared
        CardView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
