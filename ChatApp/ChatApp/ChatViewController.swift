//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Abrahim MOHAMMED on 07/12/2021.
//

import UIKit
import Firebase
class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let firstoreURL = Firestore.firestore()
    
    var myID :String?
    var userId:String?
    var userName: String?
    
    var arrMessage:[String] = []
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MycChatTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! scranTwoTableViewCell
        
        
        
        
        cell.userName2.text = arrMessage[indexPath.row]
        
             return cell
        
    }
    
    @IBOutlet weak var TextFiledMasaage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MycChatTableView.dataSource = self
        MycChatTableView.delegate = self
        myID = Auth.auth().currentUser?.uid
        
        getLesner()
      
    }
    
    @IBOutlet weak var MycChatTableView: UITableView!
    
   
    
    @IBAction func SeandAcation(_ sender: Any) {
        
        
        sendMasage()
    }
  
    
    func sendMasage(){
       
        let masaagePost = ["content":TextFiledMasaage.text!]
      
        firstoreURL.collection("Users").document("\(myID!)").collection("Messages").document("\(self.userId!)").collection("msg").document().setData(masaagePost)
        
        
        
        
        firstoreURL.collection("Users").document(("\(self.userId!)")).collection("Messages").document("\(myID!)").collection("msg").document().setData(masaagePost)
        
        
        
        
        
    }
    
    
    
    
    
    func getLesner(){
            
        firstoreURL.collection("Users").document("\(myID!)").collection("Messages").document("\(self.userId!)").collection("msg").addSnapshotListener{ documentSnapshot, error in
                
                
                guard let document = documentSnapshot else {
                           print("Error fetching document: \(error!)")
                           return
                       }
           

                self.arrMessage.removeAll()
                       for item in documentSnapshot!.documents {
           
                           
                           self.arrMessage.append(item.get("content") as! String)
                           
                       }
            self.MycChatTableView.reloadData()
            }
        }

}
