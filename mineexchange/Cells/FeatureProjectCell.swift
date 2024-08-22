import UIKit

class FeatureProjectCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4IconImg: UIImageView!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5IconImg: UIImageView!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl6IconImg: UIImageView!
    @IBOutlet weak var lbl6: UILabel!
    @IBOutlet weak var lbl7IconImg: UIImageView!
    @IBOutlet weak var lbl7: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var circleAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        roundTopCorners(for: titleView, radius: 10)
        makeImageViewCircular(circleAvatar)
        
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func roundTopCorners(for view: UIView, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: view.bounds,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
    
    func makeImageViewCircular(_ imageView: UIImageView) {
        
          let diameter = min(imageView.bounds.size.width, imageView.bounds.size.height)
          imageView.layer.cornerRadius = diameter / 2
          imageView.layer.masksToBounds = true
      }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundTopCorners(for: titleView, radius: 10)
        makeImageViewCircular(circleAvatar)
    }
}
