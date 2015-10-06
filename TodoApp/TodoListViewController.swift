//
//  ViewController.swift
//  TodoApp
//
//  Created by Masahiko Okada on 2015/10/06.
//
//

import UIKit
import CoreData

class TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var todoEntities: [Todo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoEntities = Todo.MR_findAll() as? [Todo]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoEntities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("TodoListItem")!
        cell.textLabel!.text = todoEntities[indexPath.row].item
        return cell
    }
}

