//
//  SaveTaskTableViewController.swift
//  challenge-03
//
//  Created by Jimmy Ronaldo Macedo Pizango on 2/12/22.
//

import UIKit

protocol SaveTaskTableViewControllerDelegate {
    func newTaskViewController (_ viewController: SaveTaskTableViewController, didCreateTask newTask: Task)
}


class SaveTaskTableViewController: UITableViewController {

    
    
   
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descripcionTextField: UITextField!
    
    @IBOutlet weak var prioridadTextField: UITextField!
    
    @IBOutlet weak var categoriaTextField: UITextField!
    
    var delegate: SaveTaskTableViewControllerDelegate?
    
    @IBAction func saveBarButton(_ sender: UIBarButtonItem) {
        
        let tituloSave = titleTextField.text
        let descripcionSave = descripcionTextField.text
        let prioridadSave = prioridadTextField.text
        let categoriaSave = categoriaTextField.text
        
        guard let t = tituloSave
                , !t.isEmpty else {return}
        guard let d = descripcionSave
                , !d.isEmpty else {return}
        guard let p = prioridadSave, !p.isEmpty else {return }
        guard let c = categoriaSave
                , !c.isEmpty else {return}
        
        //es la instancia que voy a enviar a la otra vista
        let newTask = Task(title: t, description: d, priority: p, category: c)
        delegate?.newTaskViewController(self, didCreateTask: newTask)
        
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


}
