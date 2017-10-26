//
//  ViewController.swift
//  CodedataSample
//
//  Created by Jegadhisan on 12/09/17.
//  Copyright © 2017 changepond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var txtName: UITextField!
  @IBOutlet var txtAge: UITextField!
  
  let appDelegate = UIApplication.shared.delegate as! AppDelegate
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  @IBAction func btnSaveAction(_ sender: Any)
  {
    let context = appDelegate.persistentContainer.viewContext
    
    let uValue      = UserDetails(context: context)
    uValue.age = txtAge.text
    uValue.name = txtName.text
    
    do {
      
      try context.save()
      
    } catch
    {
      
      let nserror = error as NSError
      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      
    }
    self.getuserData()
    
  }
  
  func getuserData()
  {
    
    let context = appDelegate.persistentContainer.viewContext
    
    do
    {
      let tasks = try context.fetch(UserDetails.fetchRequest()) as NSArray
      
      let mdl = tasks.object(at: 0) as! UserDetails
      print(mdl.name!)
      
    } catch {
      print("Fetching Failed")
    }
    
  }
  
  
}

