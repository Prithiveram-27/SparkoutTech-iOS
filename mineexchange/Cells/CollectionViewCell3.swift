//
//  CollectionViewCell3.swift
//  mineexchange
//
//  Created by Frd on 21/08/24.
//

import UIKit

class CollectionViewCell3: UICollectionViewCell {
 
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBOutlet weak var lbl1: UILabel!
    
    var isSelectedcheckBoxButton: Bool = false {
          didSet {
              updateRadioButtonState()
          }
      }

    override func awakeFromNib() {
        super.awakeFromNib()
        updateRadioButtonState()
    }
    
    private func updateRadioButtonState() {
          let imageName = isSelectedcheckBoxButton ? "Checkbox Checked" : "Checkbox Unchecked"
        checkBoxButton.setImage(UIImage(named: imageName), for: .normal)
          
      }

    @IBAction func checkbox_OnClick(_ sender: Any) {
        isSelectedcheckBoxButton.toggle()
        updateRadioButtonState()
    }
    
}
