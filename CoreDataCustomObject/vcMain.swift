
import UIKit
import CoreData

class vcMain: UIViewController {
    @IBOutlet var textUsername: UITextField!
    @IBOutlet var textPassword: UITextField!
    
    @IBAction func btnSave_Clicked(){
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let ent = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        
        var newUser = Users(entity: ent!, insertIntoManagedObjectContext: context)
        newUser.username = textUsername.text
        newUser.password = textPassword.text
        
        context.save(nil)
        println(newUser)
        println("Object Saved")
        
        
        
    }
    
    @IBAction func btnLoad_Clicked(){
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false;
        
        request.predicate = NSPredicate(format: "username = %@", textUsername.text)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if results.count > 0 {
            for user in results{
                var thisUser = user as! Users
                println(thisUser.toString())
                thisUser.addFunnyPrefix("HaHa-")
                println(thisUser.toString())
                
                
                
            }
            println("\(results.count) found!")
            
            
        }else{
            println("No Result Found")
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
