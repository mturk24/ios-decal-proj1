//  Created by Matt Turk on 10/18/16

import UIKit

@objc(ToDoListTableViewController) class ToDoListTableViewController: UITableViewController {

    @IBAction func unwindToList(_ segue:UIStoryboardSegue){
        let source: AddToDoViewController = segue.source as! AddToDoViewController
        if let item: ToDoItem = source.toDoItem{
            self.toDoItems.add(item)
            self.tableView.reloadData()
        }
        
    }
    
    var toDoItems: NSMutableArray = []
   
    var count = 0
    override func viewDidLoad(){
        super.viewDidLoad()

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "segueTest") {
            var svc = segue!.destination as! ViewControllerStats;
            var myString = String(count)
            svc.statsfield.text = myString
            
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
           
            self.toDoItems.remove(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIndentifier: NSString = "ListPrototypeCell"
        
        let cell : UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: CellIndentifier as String) )!
        
        
        let todoitem: ToDoItem = self.toDoItems.object(at: (indexPath as NSIndexPath).row) as! ToDoItem
        
        cell.textLabel?.text = todoitem.itemName as String
        
        if todoitem.completed{
            count += 1
            cell.accessoryType = .checkmark
            
        }
            
        else{
            
            cell.accessoryType = .none
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let tappedItem: ToDoItem = self.toDoItems.object(at: (indexPath as NSIndexPath).row) as! ToDoItem
        tappedItem.completed = !tappedItem.completed
        tableView.reloadData()
        
    }
}









