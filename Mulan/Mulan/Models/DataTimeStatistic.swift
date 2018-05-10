//
//  DataTimeStatistic.swift
//  Mulan
//
//  Created by Alina Zaitseva on 5/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class DataTimeStatistic {
    func timeSorting(typeSort: EnumSortType, array: [Int]) -> Double {
        let sorting = ArrayForSort()
        var result = Double()
        
        switch typeSort {
        case .Insertion:
            let now = Date()
            let numbers = sorting.insertionSort(array: array)
            result = -now.timeIntervalSinceNow
        case .Selection:
            let now = Date()
            let numbers = sorting.selectionSort(array)
            result = -now.timeIntervalSinceNow
        case .Merge:
            let now = Date()
            let numbers = sorting.mergeSort(array: array)
            result = -now.timeIntervalSinceNow
        case .Bubble:
            let now = Date()
            let numbers = sorting.bubbleSort(array)
            result = -now.timeIntervalSinceNow
        case .Quick:
            let now = Date()
            let numbers = sorting.quickSort(array: array)
            result = -now.timeIntervalSinceNow
        }
        return Double(round(1000*result)/1000)
    }
}
