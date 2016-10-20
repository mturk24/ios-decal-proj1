//  Created by Matt Turk on 10/18/16.

import UIKit

class AddToDoViewController: UIViewController {
    
    var toDoItem: ToDoItem?
    

    @IBOutlet var textfield : UITextField!
    @IBOutlet var doneButton : UIBarButtonItem!
    @IBOutlet var descfield : UITextField!
    @IBOutlet var statsButton : UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? NSObject != self.doneButton{
            return
        }
        if !(self.textfield.text?.isEmpty)!{
            self.toDoItem = ToDoItem(name: self.textfield.text!)
        }
        
    }



}

