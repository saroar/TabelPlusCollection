//
//  ViewController.swift
//  TabelPlusCollection
//
//  Created by Alif on 28/1/20.
//  Copyright © 2020 Alif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let arrayOfsections = ["table", "collection"]
    let dataForTable = ["Hello", "Hi", "Privet"]
    let dataForCollection: [UIImage] = [UIImage(named: "govOrg")!, UIImage(named: "publicTransport")!, UIImage(named: "hospital")!, UIImage(named: "govOrg")!, UIImage(named: "publicTransport")!, UIImage(named: "hospital")!, UIImage(named: "govOrg")!, UIImage(named: "publicTransport")!, UIImage(named: "hospital")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "BasicTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "BasicTableViewCell")

        let cellNib2 = UINib(nibName: "BasicTableViewCellWithCollectionViewCell", bundle: nil)
        tableView.register(cellNib2, forCellReuseIdentifier: "BasicTableViewCellWithCollectionViewCell")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfsections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return dataForTable.count
        case 1:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let sectionName = arrayOfsections[indexPath.section]

        switch sectionName {
        case "table":
            let tableCell = tableView.dequeueReusableCell(withIdentifier: "BasicTableViewCell", for: indexPath) as! BasicTableViewCell
            let tables = dataForTable[indexPath.row]
            tableCell.titleLabrl.text = tables
            return tableCell
        case "collection":
            let cell = tableView.dequeueReusableCell(withIdentifier: "BasicTableViewCellWithCollectionViewCell", for: indexPath) as! BasicTableViewCellWithCollectionViewCell

            cell.dataForCollection = dataForCollection
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            cell.collectionView.reloadData()
            cell.collectionViewCellHeight.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height

            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//     let cell:ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier) as! ProductTableViewCell
//                cell.productCollectionModel = ((item as? HomeViewModelProductItem)?.productCollectionModel)!
//                cell.frame = tableView.bounds
//                cell.layoutIfNeeded()
//                cell.prodcutCollectionView.reloadData()
//                cell.productCollectionViewHeight.constant = cell.prodcutCollectionView.collectionViewLayout.collectionViewContentSize.height
//                return cell;
//
//    }


}


extension UITableView {
    func reloadDataWithAutoSizingCellWorkAround() {
        self.reloadData()
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.reloadData()
    }
}
