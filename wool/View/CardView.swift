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
        ZStack(alignment: .bottomTrailing){
            List(cards){item in
                HStack{
                    Image(item.name!)
                    Text(item.name!)
                    Text(item.no!)
                }
            }
            Button(action: {}, label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding()
            })
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
