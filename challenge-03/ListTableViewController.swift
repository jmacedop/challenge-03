//
//  ListTableViewController.swift
//  challenge-03
//
//  Created by Jimmy Ronaldo Macedo Pizango on 2/12/22.
//

import UIKit



class ListTableViewController: UITableViewController{
    
    
    
    
    
    
    var task: [Task] =  [
        Task(title: "Estudiar Swift", description: "Conceptos", priority: "Alto", category: "Estudios"),
        Task(title: "Estudiar Java", description: "Conceptos", priority: "Alto", category: "Estudios"),
        Task(title: "Estudiar C#", description: "Conceptos", priority: "Alto", category: "Estudios"),
        Task(title: "Estudiar C++", description: "Conceptos", priority: "Alto", category: "Estudios")]
    
    //var delegate: ListTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return task.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
        
        let title = task[indexPath.row]
        cell.textLabel?.text = title.title
        // Configure the cell...
       
        return cell
    }
    
    //let blogSegueIdentifier = "DetailsViewController"
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let taskDetail = task[indexPath.row]
        guard let detailsViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return}
        detailsViewController.titulo = taskDetail.title
        detailsViewController.descripcion = taskDetail.description
        detailsViewController.prioridad = taskDetail.priority
        detailsViewController.categoria = taskDetail.category
        detailsViewController.index = indexPath.row
        detailsViewController.delegate = self
        navigationController?.pushViewController(detailsViewController, animated: true)
       
    }
    
    func taskDeletedTaskDatilsViewController(_ viewController: UIViewController, didDeletedTask index: Int) {
        print(index)
    }
   
}

extension ListTableViewController {
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        let savetask = nav?.viewControllers.first as? SaveTaskTableViewController
        savetask?.delegate = self

    }
}


extension ListTableViewController: SaveTaskTableViewControllerDelegate {
    func newTaskViewController(_ viewController: SaveTaskTableViewController, didCreateTask newTask: Task) {
        task.append(newTask)
        tableView.reloadData()
    }
    
}

extension ListTableViewController: DetailsViewControllerDelegate {
    func taskDeletedTaskDatilsViewController(_ viewController: DetailsViewController, didDeletedTask index: Int) {
        task.remove(at: index)
        tableView.reloadData()
    }
    
    

  
}
    
    
    

