//  Created by Matt Turk on 10/18/16.


import Foundation

class ToDoItem: NSObject{

    var itemName: NSString = ""
    var completed: Bool = false
    var creationDate: Date = Date()
    
    init(name:String){
        self.itemName = name as NSString
    }

}
