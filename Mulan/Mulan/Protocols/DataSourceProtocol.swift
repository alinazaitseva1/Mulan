//
//  DataSourceProtocol.swift
//  Mulan
//
//  Created by Alina Zaitseva on 5/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

protocol DataSourceProtocol {
    var arraySort: [Int] { get set }
    var count: Int { get }
    func getSortAlgorithm() -> (at: Int, to: Int, isFinishAction: Bool)
}
