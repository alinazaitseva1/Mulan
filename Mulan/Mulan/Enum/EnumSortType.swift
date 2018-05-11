//
//  EnumSortType.swift
//  Mulan
//
//  Created by Alina Zaitseva on 5/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

enum EnumSortType  {
    
    case Insertion
    case Selection
    case Merge
    case Bubble
    case Quick
    
    init (rawValue: Int) {
        switch rawValue {
        case 0:
            self = .Insertion
        case 1:
            self = .Selection
        case 2:
            self = .Merge
        case 3:
            self = .Bubble
        case 4:
            self = .Quick
        default:
            self = .Insertion //TO DO
        }
    }
    var rawValue: Int {
        get {
                switch self {
               case .Insertion:
                    return 0
                case .Selection:
                    return 1
                case .Merge:
                    return 2
                case .Bubble:
                    return 3
                case .Quick:
                    return 4
            }
        }
    }
    
    var count: Int {
        get {
            return 5
        }
    }

}
