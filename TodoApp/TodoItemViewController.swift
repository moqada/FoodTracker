//
//  TodoItemViewController.swift
//  TodoApp
//
//  Created by Masahiko Okada on 2015/10/06.
//
//

import UIKit
import CoreData

class TodoItemViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var todoField: UITextField!

    var task: Todo? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if let taskTodo = task {
            todoField.text = taskTodo.item
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: Actions
    @IBAction func cancel(sender: UIBarButtonItem) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func save(sender: UIBarButtonItem) {
        let newTask: Todo = Todo.MR_createEntity() as Todo
        newTask.item = todoField.text!
        newTask.managedObjectContext!.MR_saveToPersistentStoreAndWait()
        navigationController!.popViewControllerAnimated(true)
    }
    
}
