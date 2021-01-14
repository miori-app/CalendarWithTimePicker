//
//  DateCollectionViewCell.swift
//  CustomCalendarTime
//
//  Created by miori Lee on 2021/01/15.
//

import UIKit

class DateCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var DateCircularView: UIView!
    @IBOutlet weak var backGroundImgView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func cellForCollectionView(collectionView: UICollectionView, indexPath: IndexPath) -> DateCollectionViewCell {
        let kDateCollectionViewCellIdentifier = "kDateCollectionViewCellIdentifier"
        collectionView.register(UINib(nibName: "DateCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: kDateCollectionViewCellIdentifier)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kDateCollectionViewCellIdentifier, for: indexPath) as! DateCollectionViewCell
        return cell
    }

}
