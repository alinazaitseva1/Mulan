//
//  DataCellEntity.swift
//  Mulan
//
//  Created by Alina Zaitseva on 5/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class DataCellEntity: UITableViewCell {
    @IBOutlet weak var labelData: UILabel!
}
extension UITableViewCell {
    class var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
