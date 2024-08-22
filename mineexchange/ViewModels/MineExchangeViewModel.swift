//
//  MineExchangeViewModel.swift
//  mineexchange
//
//  Created by Frd on 20/08/24.
//

import Foundation



class MineExchangeViewModel: ObservableObject {

    private var apiService = ApiService()

    @Published var projects: [Data] = []
    @Published var error: String?

    func fetchMineExchangeData() {
        self.error = nil

        apiService.fetchMineExchangeDetails { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let mineExchangeModel):
                    self?.projects = mineExchangeModel.data!
                case .failure(let error):
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}
