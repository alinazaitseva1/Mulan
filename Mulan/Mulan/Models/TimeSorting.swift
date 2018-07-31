//
//  DataTimeStatistic.swift
//  Mulan
//
//  Created by Alina Zaitseva on 5/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class TimeSorting {
    
    func timeSorting(typeSort: SortType, array: [Int]) -> Double {
        let sorting = SortAlgorithm()
        var result = Double()
        
        switch typeSort {
        case .Insertion:
            let now = Date()
            _ = sorting.insertionSort(array: array)
            result = -now.timeIntervalSinceNow
        case .Selection:
            let now = Date()
            _ = sorting.selectionSort(array)
            result = -now.timeIntervalSinceNow
        case .Merge:
            let now = Date()
            _ = sorting.mergeSort(array: array)
            result = -now.timeIntervalSinceNow
        case .Bubble:
            let now = Date()
            _ = sorting.bubbleSort(array)
            result = -now.timeIntervalSinceNow
        case .Quick:
            let now = Date()
            _ = sorting.quickSort(array: array)
            result = -now.timeIntervalSinceNow
        }
        return result
    }
}
