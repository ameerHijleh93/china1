//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework


class ChatViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate{
    
    // Declare instance variables here
    var messageArray :[Message] = [Message]()
// var x : Int = 0
    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        var x =
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
//    }
//
//    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            let keyboardHeight = keyboardSize.height
//            print(keyboardHeight)
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set yourself as the delegate and datasource here:
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        //TODO: Set yourself as the delegate of the text field here:
         messageTextfield.delegate = self
        
        
        //TODO: Set the tapGesture here:
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)

        //TODO: Register your MessageCell.xib file here:

        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        configureTableView()
        retrieveMessages()
        messageTableView.separatorStyle = .none
 
        
    
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
//        let cellArray = ["first message","second message","third message"]
//        cell.messageBody.text = cellArray[indexPath.row]
        cell.messageBody.text = messageArray [indexPath.row].messageBody
         cell.senderUsername.text = messageArray [indexPath.row].sender
        cell.avatarImageView.image =  UIImage(named: "egg")
        if cell.senderUsername.text == FIRAuth.auth()?.currentUser?.email as! String! {
            cell.avatarImageView.backgroundColor = UIColor.flatRed()
            cell.messageBackground.backgroundColor = UIColor.flatBlue()
        } else{
            cell.avatarImageView.backgroundColor = UIColor.brown
            cell.messageBackground.backgroundColor = UIColor.cyan
        }
         return cell
    }
    
    
    //TODO: Declare numberOfRowsInSection here:
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    //TODO: Declare tableViewTapped here:
    
    @objc func tableViewTapped () {
        messageTextfield.endEditing(true)
    }
    
    //TODO: Declare configureTableView here:
    
    func configureTableView(){
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
 

    
    //TODO: Declare textFieldDidBeginEditing here:
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       // heightConstraint.constant = CGFloat(x); +333
        UIView.animate(withDuration: 1){
       self.heightConstraint.constant =  333
           self.view.layoutIfNeeded()
            
        }
    }

    
    //TODO: Declare textFieldDidEndEditing here:
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5 ){
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()}
    }
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        messageTextfield.endEditing(true)
        //TODO: Send the message to Firebase and save it in our database
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        let messagDB = FIRDatabase.database().reference().child("Message")
        let messageDictinary = ["sender" : FIRAuth.auth()?.currentUser?.email , "messageBody" : messageTextfield.text]
        messagDB.childByAutoId().setValue(messageDictinary){
            (error,ref) in
            if error != nil {
                print(errno)
            } else{
                print("is okk")
               self.messageTextfield.isEnabled = true
               self.sendButton.isEnabled = true
                self.messageTextfield.text = ""
            }
        }
    }
    
    //TODO: Create the retrieveMessages method here:
    
    func retrieveMessages(){
        let messageDB = FIRDatabase.database().reference().child("Message")
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary <String , String>
            let text = snapshotValue["messageBody"]!
            let sender = snapshotValue["sender"]!
            //print(text, sender)
            let message = Message()
            message.messageBody = text
            message.sender = sender
            self.messageArray.append(message)
            self.configureTableView()
            self.messageTableView.reloadData()
        }
    }

    
    
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        //TODO: Log out the user and send them back to WelcomeViewController
        do {
            
       try FIRAuth.auth()?.signOut()
           //   navigationController?.popToRootViewController(animated: true)
             // navigationController?.popViewController(animated: true)      back to last one uiview
        }
        catch{
            print("canot do log out")
        }
        guard (navigationController?.popToRootViewController(animated: true)) != nil
        
            else{
                print("we have aproblem")
                return
        }
    }
    


}
