//
//  DetailViewController.swift
//  test
//
//  Created by Mohammad Usman on 9/7/18.
//  Copyright © 2018 Mohammad Usman. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController , NSFetchedResultsControllerDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var managedObjectContext: NSManagedObjectContext? = nil

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.valueForKey("timeStamp")!.description
            }
        }
    }
    
    
    @IBAction func delBtn(sender: AnyObject) {
        
        let context = self.fetchedResultsController.managedObjectContext
        context.deleteObject(self.fetchedResultsController.NSManagedObject)
        
        do {
            try context.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            //print("Unresolved error \(error), \(error.userInfo)")
            abort()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

