//
//  DetailsViewController.swift
//  challenge-03
//
//  Created by Jimmy Ronaldo Macedo Pizango on 2/12/22.
//

import UIKit

protocol DetailsViewControllerDelegate{
    func taskDeletedTaskDatilsViewController(_ viewController: DetailsViewController, didDeletedTask index: Int)
}

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var priorityLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var indexLabel: UILabel!
    
    var delegate: DetailsViewControllerDelegate?
    
    
    @IBAction func deletedBarButton(_ sender: Any) {
        //
        if let index = self.indexLabel.text, let id = Int(index) {
            delegate?.taskDeletedTaskDatilsViewController(self, didDeletedTask:id)
            self.navigationController?.popViewController(animated: true)
           }
      
    }
    
    var titulo: String = ""
    var descripcion: String = ""
    var prioridad: String = ""
    var categoria: String = ""
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titulo
        descriptionLabel.text = descripcion
        priorityLabel.text = prioridad
        categoryLabel.text = categoria
        indexLabel.text = String(index)
       
    }
    

}


