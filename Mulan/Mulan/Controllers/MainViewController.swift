//
//  MainViewController.swift
//  Mulan
//
//  Created by Alina Zaitseva on 5/14/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var randomArray = (1...100).map{_ in Int(arc4random())}
    
    @IBOutlet var tableViewSort: UITableView!
    @IBOutlet weak var progresssView: UIProgressView!
    @IBOutlet weak var labelPersent: UILabel!
    
    let dispatchQuene = DispatchQueue.global()
    let operationQuene = OperationQueue()
    
    let sortType: [SortType] = [.Insertion, .Selection, .Merge, .Bubble, .Quick]
    let arraySizes = [1000, 8000]
    let sorting = SortAlgorithm()
    var progress = 0.0
    var timeForSort = TimeSorting()
    var resultArray = [[String]]() {
        didSet{
            DispatchQueue.main.async {
                self.tableViewSort.reloadData()
                self.progresssView.progress = Float(self.progress)
                self.labelPersent.text = String(format: "%.0f", self.progresssView.progress * 100) + " % "
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setArray()
        performSorting()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySizes.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableView", for: indexPath) as? CellTableView else { return UITableViewCell() }
        cell.labelSort.text = resultArray[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableViewSort.bounds.width, height: 40))
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: tableViewSort.bounds.width - 40, height: 30))
        view.backgroundColor = UIColor.yellow
        label.font = UIFont(name: "Aril", size: 25)
        label.textColor = UIColor.black
        label.text = sortType[section].rawValue
        view.addSubview(label)
        return view
    }
    
    func performSorting() {
        operationQuene.addOperation {
            self.timeForSort.timeSorting(typeSort: .Quick, array: self.randomArray)
        }
        operationQuene.addOperation {
            self.timeForSort.timeSorting(typeSort: .Merge, array: self.randomArray)
        }
        dispatchQuene.async {
            self.timeForSort.timeSorting(typeSort: .Insertion, array: self.randomArray)
        }
        dispatchQuene.async {
            self.timeForSort.timeSorting(typeSort: .Selection, array: self.randomArray)
        }
        dispatchQuene.async {
            self.timeForSort.timeSorting(typeSort: .Bubble, array: self.randomArray)
        }
    }
    
    func setArray() {
        for i in 0..<sortType.count {
            resultArray.append([])
            for _ in 0..<arraySizes.count{
                resultArray[i].append("")
            }
        }
    }
}
