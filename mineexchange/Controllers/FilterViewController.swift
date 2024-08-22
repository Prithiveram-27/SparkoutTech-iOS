import UIKit
import Combine

class FilterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView3: UICollectionView!
    @IBOutlet weak var collectionView1_height: NSLayoutConstraint!
    @IBOutlet weak var collectionView3_height: NSLayoutConstraint!
    @IBOutlet weak var collectionView2_height: NSLayoutConstraint!
    @IBOutlet weak var collectionView4: UICollectionView!
    @IBOutlet weak var collectionView5: UICollectionView!
    
    private var viewModel = FiltersViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    private var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchFiltersData()
        
        viewModel.$filters
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.reloadData()
            }
            .store(in: &cancellables)
        
        setupCollectionViews()
    }
    
    private func setupCollectionViews() {
        let collections: [UICollectionView] = [collectionView1, collectionView2, collectionView3, collectionView4, collectionView5]
        collections.forEach { collectionView in
            collectionView.delegate = self
            collectionView.dataSource = self
        }
        collectionView3.isScrollEnabled = false
        self.view.layoutIfNeeded()
    }
    
    private func reloadData() {
        collectionView1.reloadData()
        collectionView2.reloadData()
        collectionView3.reloadData()
        collectionView4.reloadData()
        collectionView5.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionView1:
            return viewModel.filters?.continents?.count ?? 0
        case collectionView2:
            if let filters = viewModel.filters?.filters, !filters.isEmpty {
                let firstFilter = filters[0]
                return firstFilter.prompts?.count ?? 0
            }
            return 0
        case collectionView3:
            return viewModel.filters?.commodities?.count ?? 0
        case collectionView4:
            if let filters = viewModel.filters?.filters, !filters.isEmpty {
                let firstFilter = filters[1]
                return firstFilter.prompts?.count ?? 0
            }
            return 0
        case collectionView5:
            if let filters = viewModel.filters?.filters, !filters.isEmpty {
                let intentionFilter = filters.first { $0.question == "Intention" }
                return intentionFilter?.prompts?.count ?? 0
            }
            return 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case collectionView1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell1", for: indexPath) as! CollectionViewCell1
            let continent = viewModel.filters?.continents?[indexPath.item] ?? ""
            cell.lbl1.text = continent
            
            let isSelected = (indexPath == selectedIndexPath)
            cell.configure(with: indexPath, isSelected: isSelected,selectedIndexPath: selectedIndexPath)
            
            cell.onRadioButtonClicked = { [weak self] indexPath in
                self?.handleRadioButtonForCell1(at: indexPath)
            }
            
            return cell
            
        case collectionView2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2", for: indexPath) as! CollectionViewCell2
            if let filters = viewModel.filters?.filters, !filters.isEmpty {
                let firstFilter = filters[0]
                if indexPath.item < (firstFilter.prompts?.count ?? 0) {
                    let prompt = firstFilter.prompts?[indexPath.item]
                    cell.lbl1.text = prompt?.prompt_values
                } else {
                    cell.lbl1.text = nil
                }
            }
            
            let isSelected = (indexPath == selectedIndexPath)
            cell.configure(with: indexPath, isSelected: isSelected,selectedIndexPath: selectedIndexPath)
            
            cell.onRadioButtonClicked = { [weak self] indexPath in
                self?.handleRadioButtonForCell2(at: indexPath)
            }
            return cell
            
        case collectionView3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell3", for: indexPath) as! CollectionViewCell3
            let commodity = viewModel.filters?.commodities?[indexPath.item] ?? ""
            cell.lbl1.text = commodity
            return cell
            
        case collectionView4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell4", for: indexPath) as! CollectionViewCell4
            if let filters = viewModel.filters?.filters, !filters.isEmpty {
                let firstFilter = filters[1]
                if indexPath.item < (firstFilter.prompts?.count ?? 0) {
                    let prompt = firstFilter.prompts?[indexPath.item]
                    cell.lbl1.text = prompt?.prompt_values
                } else {
                    cell.lbl1.text = nil
                }
            }
            
            let isSelected = (indexPath == selectedIndexPath)
            cell.configure(with: indexPath, isSelected: isSelected,selectedIndexPath: selectedIndexPath)
            
            cell.onRadioButtonClicked = { [weak self] indexPath in
                self?.handleRadioButtonForCell4(at: indexPath)
            }
            return cell
            
        case collectionView5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell5", for: indexPath) as! CollectionViewCell5
            if let filters = viewModel.filters?.filters, !filters.isEmpty {
                let intentionFilter = filters.first { $0.question == "Intention" }
                if let prompts = intentionFilter?.prompts, indexPath.item < prompts.count {
                    let prompt = prompts[indexPath.item]
                    cell.lbl1.text = prompt.prompt_values
                } else {
                    cell.lbl1.text = nil
                }
            }
            
            let isSelected = (indexPath == selectedIndexPath)
            cell.configure(with: indexPath, isSelected: isSelected,selectedIndexPath: selectedIndexPath)
            
            cell.onRadioButtonClicked = { [weak self] indexPath in
                self?.handleRadioButtonClick(at: indexPath)
            }
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    private func handleRadioButtonForCell1(at indexPath: IndexPath) {
        guard selectedIndexPath != indexPath else { return }
        let previousIndexPath = selectedIndexPath
        selectedIndexPath = indexPath
        if let previousIndexPath = previousIndexPath, let previousCell = collectionView1.cellForItem(at: previousIndexPath) as? CollectionViewCell1 {
            previousCell.configure(with: previousIndexPath, isSelected: false, selectedIndexPath: selectedIndexPath)
        }
        if let currentCell = collectionView1.cellForItem(at: indexPath) as? CollectionViewCell1 {
            currentCell.configure(with: indexPath, isSelected: true, selectedIndexPath: selectedIndexPath)
        }
    }
    
    private func handleRadioButtonForCell2(at indexPath: IndexPath) {
        guard selectedIndexPath != indexPath else { return }
        let previousIndexPath = selectedIndexPath
        selectedIndexPath = indexPath
        if let previousIndexPath = previousIndexPath, let previousCell = collectionView2.cellForItem(at: previousIndexPath) as? CollectionViewCell2 {
            previousCell.configure(with: previousIndexPath, isSelected: false, selectedIndexPath: selectedIndexPath)
        }
        if let currentCell = collectionView2.cellForItem(at: indexPath) as? CollectionViewCell2 {
            currentCell.configure(with: indexPath, isSelected: true, selectedIndexPath: selectedIndexPath)
        }
    }
    
    private func handleRadioButtonForCell4(at indexPath: IndexPath) {
        guard selectedIndexPath != indexPath else { return }
        let previousIndexPath = selectedIndexPath
        selectedIndexPath = indexPath
        if let previousIndexPath = previousIndexPath, let previousCell = collectionView4.cellForItem(at: previousIndexPath) as? CollectionViewCell4 {
            previousCell.configure(with: previousIndexPath, isSelected: false, selectedIndexPath: selectedIndexPath)
        }
        if let currentCell = collectionView4.cellForItem(at: indexPath) as? CollectionViewCell4 {
            currentCell.configure(with: indexPath, isSelected: true, selectedIndexPath: selectedIndexPath)
        }
    }
    
    private func handleRadioButtonClick(at indexPath: IndexPath) {
        guard selectedIndexPath != indexPath else { return }
        let previousIndexPath = selectedIndexPath
        selectedIndexPath = indexPath
        if let previousIndexPath = previousIndexPath, let previousCell = collectionView5.cellForItem(at: previousIndexPath) as? CollectionViewCell5 {
            previousCell.configure(with: previousIndexPath, isSelected: false, selectedIndexPath: selectedIndexPath)
        }
        if let currentCell = collectionView5.cellForItem(at: indexPath) as? CollectionViewCell5 {
            currentCell.configure(with: indexPath, isSelected: true, selectedIndexPath: selectedIndexPath)
        }
    }
}
