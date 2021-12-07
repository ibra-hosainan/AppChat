//
//  HomeViewController.swift
//  ChatApp
//
//  Created by Abrahim MOHAMMED on 07/12/2021.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sendUsearname:String?
    var sendIDUsear:String?

    var arrUsear:[Userr]=[]
    
    
    let firsstoreURL = Firestore.firestore()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrUsear.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MytaballView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! scraneOneUITableViewCell
        
               
        cell.userName.text = arrUsear[indexPath.row].name
        
             return cell
      
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
//        sendUsearname = arrUsear[indexPath.row].name
//        sendIDUsear = arrUsear[indexPath.row].id
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        
        
        vc.userName = arrUsear[indexPath.row].name!
        vc.userId = arrUsear[indexPath.row].id!
        
        print("========" , arrUsear[indexPath.row].name! ," : ",arrUsear[indexPath.row].id!)
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true, completion: nil)
        
        
//        performSegue(withIdentifier: "moveChat", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "moveChat"{
//
//            let vc = segue.destination as! ChatViewController
//
//
//            vc.userId = sendIDUsear
//            vc.userName = sendUsearname
//
//
//        }
//    }
    

    @IBOutlet weak var MytaballView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MytaballView.delegate = self
        MytaballView.dataSource = self
        getUsearFromFiresore()
        
    }
    
    
    @IBAction func signOutAcation(_ sender: Any) {
        
        do{
            
            
           try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
            
            
            
        }catch{
            
            printContent(error.localizedDescription)
            
        }
        
    }
    
    func getUsearFromFiresore(){
        
        firsstoreURL.collection("Users").getDocuments { snapshot, error in
            
            for user in snapshot!.documents{
                
                print("============")
                
                
               // print(id.documentID) //all the documentID
                 
                print(user.data()) //print all the filed
                
                if Auth.auth().currentUser?.uid != user.get("ID")as!String{
                    
                    
                    self.arrUsear.append(Userr(name: user.get("Name")as!String, id: user.get("ID")as!String))

                }
                
                
                
                
            }
            self.MytaballView.reloadData()
            
            
        }
        
        
    }
    
   
}

struct Userr {
    
    var name : String?
    var id:String?
    
    init( name : String,id:String){
        
        self.name = name
        self.id = id
        
    }
    
    
    
    
}
