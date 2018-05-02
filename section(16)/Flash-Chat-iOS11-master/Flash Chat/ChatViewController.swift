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


class ChatViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource, UITextFieldDelegate {
    
    
    
    
    
    // Declare instance variables here
    var messageArray : [Message] = [Message]()

    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
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
      //  messageTableView.register(UINib (nibName : "MessageCell" , Bundle: nil), forCellReuseIdentifier: "customMessageCell")
        messageTableView.register(UINib.init(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")

       
        configureTableView()
        retrieveMessages()
        messageTableView.separatorStyle = .none
       // scrollViewWillEndDragging(messageTableView, withVelocity: <#CGPoint#>, targetContentOffset: <#UnsafeMutablePointer<CGPoint>#>)
       
        
//        let scrollPoint = CGPoint(x: 0, y: self.messageTableView.contentSize.height - self.messageTableView.frame.size.height)
//        self.messageTableView.setContentOffset(scrollPoint, animated: true)
      //  messageTableView.setContentOffset(CGPoint.init(x: 0, y: 1000000000), animated: true)
       // scrollToBottom()
       // messageTableView.scrollToRow(at: <#T##IndexPath#>, at: <#T##UITableViewScrollPosition#>, animated: <#T##Bool#>)
    
    
    
    }
//    CGPoint bottomOffset = CGPointMake(0, self.messageTableView.contentSize.height - self.messageTableView.bounds.size.height);
//    [self.messageTableView setContentOffset:bottomOffset animated:YES];
    
//    func scrollToBottom(){
//        DispatchQueue.main.async {
//            let indexPath = IndexPath(row: self.messageArray.count-1, section: 0)
//            self.messageTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
//        }
//    }
    
//    func scrollToLastRow() {
//        let indexPath = NSIndexPath(forRow: objects.count - 1, inSection: 0)
//        self.messageTableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
//    }
    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
//        let masegArray = ["First Message","Second Message","Thired Message"]
//        cell.messageBody.text = masegArray[indexPath.row]
        cell.messageBody.text = messageArray[indexPath.row].messagBoody
         cell.senderUsername.text = messageArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named : "egg")
        if cell.senderUsername.text == Auth.auth().currentUser?.email as String! {
            cell.avatarImageView.backgroundColor = UIColor.flatMint()
            cell.messageBackground.backgroundColor = UIColor.flatBlue()
        } else {
            cell.avatarImageView.backgroundColor = UIColor.flatWatermelon()
            cell.messageBackground.backgroundColor = UIColor.flatGray()
        }
        return cell
    
    }
//    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//        self.lastContentOffset = scrollView.contentOffset.y
//    }
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//
//        if targetContentOffset.pointee.y < scrollView.contentOffset.y {
//            targetContentOffset.pointee.y = scrollView.contentOffset.y
//        } else {
//            // it's going down
//        }
//
//    }
//
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    
    //TODO: Declare tableViewTapped here:
    @objc func tableViewTapped (){
        messageTextfield.endEditing(true)
    }
    
    
    //TODO: Declare configureTableView here:
    
    func configureTableView () {
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    

    
    //TODO: Declare textFieldDidBeginEditing here:
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.5 ){
         //   self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()}
    }
    
    
    //TODO: Declare textFieldDidEndEditing here:
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5 ){
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()}
    }
    
    /////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        messageTextfield.endEditing(true)
        
        //TODO: Send the message to Firebase and save it in our database
       messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        let messagesDB = Database.database().reference().child("messages")
        let messagDectinary = ["sendar" : Auth.auth().currentUser?.email , "messageBoody" : messageTextfield.text!]
        messagesDB.childByAutoId().setValue(messagDectinary) {
            (error , reference) in
            if error != nil {
                print(error)
            } else {
                
                
                print("the save data is sucsess")
                self.messageTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                  self.messageTextfield.text = ""
            }
        }
        
    }
    
    //TODO: Create the retrieveMessages method here:
    func retrieveMessages() {
        let messageDB = Database.database().reference().child("messages")
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary <String,String>
            let text = snapshotValue["messageBoody"]!
             let sendar = snapshotValue["sendar"]!
           // print(text,sendar)
            let message = Message()
            message.messagBoody = text
            message.sender = sendar
            self.messageArray.append(message)
            self.configureTableView()
            
            

            
            self.messageTableView.reloadData()
           
            UIView.animate(withDuration: 0.0, delay: 0.3, options: .curveEaseInOut, animations: {
                self.messageTableView.scrollToRow(at: IndexPath(row: self.messageTableView.numberOfRows(inSection: 0) - 1, section: 0), at: .bottom, animated: true)
            })

            
        }
    }
    

    
    
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        //TODO: Log out the user and send them back to WelcomeViewController
        do {
         try   Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch {
            print("alot of problem")
        }
        
    }
    


}
