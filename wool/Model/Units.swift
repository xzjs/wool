//
//  Unit.swift
//  wool
//
//  Created by xzjs on 2022/6/8.
//

import Foundation

enum Units:String,CaseIterable,Identifiable{
    case Day
    case Week
    case Month
    case Year
    
    var id:Self{self}
}
