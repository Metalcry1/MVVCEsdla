import UIKit

class DetailViewController: UIViewController {

    var characterData: CharacterModel?
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var nameCharDetail: UILabel!
    @IBOutlet weak var descriptionDetail: UITextView!

    
    @IBOutlet weak var jobDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView(characterData: characterData)
                // Do any additional setup after loading the view.
    }

    func updateView(characterData: CharacterModel?){
        update(name: characterData?.name)
        update(image: characterData?.image)
        update(description: characterData?.description)
        update(job: characterData?.job)
    }
    
    private func update(name: String?){
        nameCharDetail.text = name ?? ""
        }
               
    private func update(image: String?){
        imageDetail.image = UIImage(named: image ?? "")
    }
     private func update(description: String?){
         descriptionDetail.text = description ?? ""
        }
    
    private func update(job: String?){
        jobDetail.text = job ?? ""
       }
}
