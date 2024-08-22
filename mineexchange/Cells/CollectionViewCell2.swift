//
//  CollectionViewCell2.swift
//  mineexchange
//
//  Created by Frd on 21/08/24.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {
    
    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var lbl1: UILabel!
    
    var onRadioButtonClicked: ((IndexPath) -> Void)?
    private var currentIndexPath: IndexPath?
    private var selectedIndexPath: IndexPath?

    override func awakeFromNib() {
        super.awakeFromNib()
        updateRadioButtonState()
    }
    
    private func updateRadioButtonState() {
        let imageName = (currentIndexPath == selectedIndexPath) ? "Radio Selected" : "Radio Unselected"
        radioButton.setImage(UIImage(named: imageName), for: .normal)
    }
    @IBAction func radioButton_OnCLick(_ sender: Any) {
        if let indexPath = currentIndexPath {
                   onRadioButtonClicked?(indexPath)
               }
    }
    
    func configure(with indexPath: IndexPath, isSelected: Bool,selectedIndexPath: IndexPath?) {
         self.currentIndexPath = indexPath
        self.selectedIndexPath = selectedIndexPath
         updateRadioButtonState()
     }
}
