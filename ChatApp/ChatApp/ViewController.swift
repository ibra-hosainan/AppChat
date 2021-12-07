//
//  ViewController.swift
//  ChatApp
//
//  Created by Abrahim MOHAMMED on 07/12/2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {
   
    
    let fireStoreURL = Firestore.firestore()

    

   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    

    @IBAction func signAcation(_ sender: Any) {
        
        if Auth.auth().currentUser?.uid==nil{
            
            
            Auth.auth().signInAnonymously { user, error in
                
                if error == nil{
                    let dataUser = ["Name":"User","ID":user?.user.uid]
                    
                    self.fireStoreURL.collection("Users").document((user?.user.uid)!).setData(dataUser)
                    
                    self.performSegue(withIdentifier: "MoveHome", sender: self)
                    
                }
            }
            
            
            
        }else{
            
            self.performSegue(withIdentifier: "MoveHome", sender: self)

        }
        
    }
    
}

