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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        todoEntities = Todo.MR_findAll() as? [Todo]
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoEntities = Todo.MR_findAll() as? [Todo]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // アイテム数を返す
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoEntities.count
    }

    // アイテムセルの生成
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("TodoListItem")!
        cell.textLabel!.text = todoEntities[indexPath.row].item
        return cell
    }

    // アイテムの編集
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // スワイプで削除
        if editingStyle == .Delete {
            todoEntities.removeAtIndex(indexPath.row).MR_deleteEntity()
            NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
            tableView.reloadData()
        }
    }
}

