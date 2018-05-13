//
//  SortClass.swift
//  Mulan
//
//  Created by Alina Zaitseva on 5/14/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class SortAlgorithm {
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
    
    func mergeSort( array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
        let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))
        
        return merge(leftArray, rightArray)
    }
    
    
    private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedArray: [Int] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        return orderedArray
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
    
    func quickSort(array: [Int], left: Int = 0,right: Int? = nil) -> [Int] {
        
        let right = right ?? array.count-1
        
        var arrayResult = array
        var m = left
        var k = right
        let center = ( arrayResult[(m+k) / 2] )
        var buf = 0
        repeat {
            while arrayResult[m] < center { m += 1 }
            while arrayResult[k] > center { k -= 1 }
            if m <= k {
                buf = arrayResult[m]
                arrayResult[m] = arrayResult[k]
                arrayResult[k] = buf
                m += 1
                k -= 1
            }
        } while m < k
        
        if left < k {
            arrayResult = quickSort( array: arrayResult, left: left,right: k )
        }
        if m < right {
            arrayResult = quickSort( array: arrayResult, left: m,right: right )
        }
        
        return arrayResult
    }
    
}
