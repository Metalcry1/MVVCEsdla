//
//  HomeTableViewController.swift
//  MVVCEsdla
//
//  Created by Daniel Serrano on 4/10/23.
//

import UIKit

class HomeTableViewController: UITableViewController {
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()


    }
    
    private func registerCells (){
        tableView.register(UINib(nibName: "HomeCellTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sampleCharacterData.count
    }

    @IBOutlet var vista: UITableView!
    @IBOutlet var sd: UITableView!
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCellTableViewCell else{
            return UITableViewCell()
        }
        
//        if(indexPath.row < sampleCharacterData.count){
//            let character = sampleCharacterData[indexPath.row]
//            let imagen = UIImage(named: character.image ?? "")
//            cell.imageCellHome.image = imagen
//            cell.nameCellHome.text = character.name
//        }
//
        if(indexPath.row < sampleCharacterData.count){
            let data = sampleCharacterData[indexPath.row]
            let homeData = ImageCellModel(image: data.image, name: data.name)
            cell.updateViews(data: homeData)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = DetailViewController()
        
        if(indexPath.row < sampleCharacterData.count){
            nextVC.characterData = sampleCharacterData[indexPath.row]
        }
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
