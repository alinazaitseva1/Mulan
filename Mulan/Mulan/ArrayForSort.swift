//
//  ArrayForSort.swift
//  Mulan
//
//  Created by Alina Zaitseva on 5/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

class ArrayForSort {
    
    func insertionSort( array: [Int]) -> [Int] {
        guard array.count > 1 else { return array}
        var b = array
        for i in 1..<b.count {
            var y = i
            let temp = b[y]
            while y > 0 && temp < b[y-1] {
                b[y] = b[y-1]
                y -= 1
            }
            b[y] = temp
        }
        return b
    }

    func selectionSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        var a = array
        for x in 0 ..< a.count - 1 {
            var lowest = x
            for y in x + 1 ..< a.count {
                if a[y] < a[lowest] {
                    lowest = y
                }
            }
            if x != lowest {
                a.swapAt(x, lowest)
            }
        }
        return a
    }

    func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        return merge(leftPile: leftArray, rightPile: rightArray) }
    func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T]
    { var leftIndex = 0
        var rightIndex = 0
        var orderedPile: [T] = []
        if orderedPile.capacity < leftPile.count + rightPile.count
        { orderedPile.reserveCapacity(leftPile.count + rightPile.count) }
        while true { guard leftIndex < leftPile.endIndex
            else { orderedPile.append(contentsOf: rightPile[rightIndex..<rightPile.endIndex])
                break }
            guard rightIndex < rightPile.endIndex
                else { orderedPile.append(contentsOf: leftPile[leftIndex..<leftPile.endIndex])
                    break }
            if leftPile[leftIndex] < rightPile[rightIndex]
            { orderedPile.append(leftPile[leftIndex])
                leftIndex += 1 } else {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1 }
        }
        return orderedPile
    }

    func bubbleSort(_ array: [Int]) -> [Int] {
        var arr = array
        for _ in 0...arr.count {
            for item in 1...arr.count-1 {
                if arr[item-1] > arr[item] {
                    let maxItem = arr[item-1]
                    arr[item-1] = arr[item]
                    arr[item] = maxItem
                }
            }
        }
        return arr
    }

    func quickSort<T: Comparable>(_ a: [T]) -> [T] {
        guard a.count > 1 else { return a }

        let pivot = a[a.count/2]
        let less = a.filter { $0 < pivot }
        let equal = a.filter { $0 == pivot }
        let greater = a.filter { $0 > pivot }

        return quickSort(less) + equal + quickSort(greater)
    }
}
