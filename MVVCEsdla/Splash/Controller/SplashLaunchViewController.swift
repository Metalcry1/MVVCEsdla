//
//  SplashLaunchViewController.swift
//  MVVCEsdla
//
//  Created by Daniel Serrano on 4/10/23.
//

import UIKit

//MARK: - PROTOCOL -

protocol SplashLaunchViewProtocol: AnyObject{
    func showLoading(_ show: Bool)
        func navigateToHome()
}

//MARK: - CLASE -

class SplashLaunchViewController: UIViewController {
    var viewModel: SplashViewModelProtocol?
    
    //MARK: - OULETS
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    

    
    //MARK: - LICECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel = SplashViewModel(viewDelegate: self) // sacamos mi viewmodel dentro del viewcontroller, para hacer inyeccion de dependencias, p  era inyectar a el viewmodel que quieras, mientras cumpla el protocolo viewprotocol "SplashLaunchViewProtocol" en este caso
        
        viewModel?.onViewsLoaded()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        activityIndicator.stopAnimating()
    }


}


//MARK: - EXTENSION -

extension SplashLaunchViewController: SplashLaunchViewProtocol{
    func showLoading(_ show: Bool) {
        switch show{
        case true where !activityIndicator.isAnimating:
            activityIndicator.startAnimating()
            //print("entro")
        case false where activityIndicator.isAnimating:
            activityIndicator.stopAnimating()
           // print("salgo")
        default: break
        }
        
    }
    
    func navigateToHome() {
        let nextVC = HomeTableViewController()
        navigationController?.setViewControllers([nextVC], animated: true)
    }
    
    
}
