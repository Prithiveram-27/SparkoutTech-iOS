//
//  ViewController.swift
//  mineexchange
//
//  Created by Frd on 20/08/24.
//

import UIKit
import Combine

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lblHeader1: UILabel!
    @IBOutlet weak var lblHeader2: UILabel!
    @IBOutlet weak var lblHeader3: UILabel!
    @IBOutlet weak var lblHeader4: UILabel!
    @IBOutlet weak var parentSubView: UIView!
    @IBOutlet weak var searchbarView: UIView!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblDiscover: UILabel!
    @IBOutlet weak var lblFeaturedProjects: UILabel!
    
    
    private var viewModel = MineExchangeViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.fetchMineExchangeData()
        
        setupViews()
        setupSearchBar()
        
        viewModel.$projects
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    func setupViews(){
        lblHeader3.textColor = .orange
        lblDiscover.textColor = .white
        
        lblHeader1.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        lblHeader2.font = UIFont.italicSystemFont(ofSize: 15)
        lblHeader3.font = UIFont.italicSystemFont(ofSize: 15)
        lblHeader4.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        
        searchbarView.layer.cornerRadius = 10
        searchbarView.layer.masksToBounds = true
    }
    
    func setupSearchBar(){
        if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
                   
                   if let leftView = searchTextField.leftView {
                       leftView.isHidden = true
                   }
                   searchTextField.placeholder = "Search by region,commodity"
                   searchTextField.borderStyle = .none
                   searchTextField.backgroundColor = UIColor.clear
               }
        if let searchBarBackgroundView = searchBar.subviews.first?.subviews.first {
            searchBarBackgroundView.backgroundColor = UIColor.clear
        }
    }

    @IBAction func btnFilter_onClick(_ sender: Any) {
        let FilterScreen = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as? FilterViewController
        self.navigationController?.pushViewController(FilterScreen!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projects.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureProjectCell") as! FeatureProjectCell
        
        let project = viewModel.projects[indexPath.row]
        
        cell.lblName.text = project.name
        cell.lblCompanyName.text = project.company_name
        cell.lbl1.text = project.commodity
        
        if let images = project.image, let firstImage = images.first {
            loadImage(from: firstImage.url) { image in
                cell.imgView.image = image
            }
        } else {
            cell.imgView.image = nil
        }
        
        cell.lbl2.text = project.created_at
        
        let createDate = project.created_at
        
        let isoDateString = createDate
        if let formattedDate = formatDate(isoDateString: isoDateString!) {
            cell.lbl2.text = "Listed \(formattedDate)"
        } else {
            cell.lbl2.text = "Listed 01 Apr, 24"
        }
        
        cell.lbl3.text = project.seller_id?.occupation
        cell.lbl4.text = project.commodity
        cell.lbl5.text = project.country
        cell.lbl6.text = project.commodity_sector?[0]
        cell.lbl7.text = project.price_range
        
        return cell
    }

    
    
    
    func loadImage(from urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        }.resume()
    }
    
    
    func formatDate(isoDateString: String) -> String? {
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        inputFormatter.timeZone = TimeZone(abbreviation: "UTC")

        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMM, yy"
        outputFormatter.locale = Locale(identifier: "en_US")
        
        
        guard let date = inputFormatter.date(from: isoDateString) else {
            print("Failed to parse date")
            return nil
        }
        
        
        let formattedDate = outputFormatter.string(from: date)
        return formattedDate
    }
}



