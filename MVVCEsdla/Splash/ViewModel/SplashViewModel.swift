//
//  SplashViewModel.swift
//  MVVCEsdla
//
//  Created by Daniel Serrano on 4/10/23.
//

import Foundation

//MARK: - PROTOCOL -
protocol SplashViewModelProtocol{
    func onViewsLoaded()
}

//MARK: - CLASE -

final class SplashViewModel{
    
    private weak var viewDelegate: SplashLaunchViewProtocol?
    
    init(viewDelegate: SplashLaunchViewProtocol?) {
        self.viewDelegate = viewDelegate
    }
    private func loadData(){
        viewDelegate?.showLoading(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            [weak self] in
            self?.viewDelegate?.showLoading(false)
            //print("helloo")
            self?.viewDelegate?.navigateToHome()
        
            
    }
}
}
//MARK: - EXTENSION -

extension SplashViewModel: SplashViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }

    
}
