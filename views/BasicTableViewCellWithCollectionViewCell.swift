//
//  BasicTableViewCellWithCollectionViewCell.swift
//  TabelPlusCollection
//
//  Created by Alif on 28/1/20.
//  Copyright © 2020 Alif. All rights reserved.
//

import UIKit

class BasicTableViewCellWithCollectionViewCell: UITableViewCell {

    let identifier = String(describing: BasicTableViewCellWithCollectionViewCell.self)
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewCellHeight: NSLayoutConstraint!

    var dataForCollection = [UIImage]()

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewCellHeight.constant = 52
        collectionView.register(UINib(nibName: "BasicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BasicCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension BasicTableViewCellWithCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataForCollection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasicCollectionViewCell", for: indexPath) as! BasicCollectionViewCell
        cell.layer.cornerRadius = 8

        let data = dataForCollection[indexPath.row]
        cell.img.image = data
        return cell
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(
//            width: collectionView.frame.size.width/2.5,
//            height: collectionView.frame.size.width/2
//        )
//    }

//       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//              delegate.productClick(name: productCollectionModel[indexPath.row].name, image: productCollectionModel[indexPath.row].bannerImage, id: productCollectionModel[indexPath.row].Id)
//
//       }
}
