//
//  FiltersViewModel.swift
//  mineexchange
//
//  Created by Frd on 21/08/24.
//

import Foundation

class FiltersViewModel: ObservableObject {

    private var apiService = ApiService()

    @Published var filters: DataModel?
    @Published var error: String?

    func fetchFiltersData() {
        self.error = nil

        apiService.fetchProjectFilters { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let filterModel):
                    self?.filters = filterModel.data
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}
