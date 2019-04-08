//
//  ViewController.swift
//  Meme Hut
//
//  Created by Anthony Serrato on 6/21/18.
//  Copyright © 2018 What U Want. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SDWebImage

class CustomTableViewCell : UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!
    
    var itemText: Array<String> = []
    var itemLink: Array<String> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.register(UINib(nibName: "itemFeed", bundle: nil), forCellReuseIdentifier: "custom")
        tableView.delegate = self
        tableView.dataSource = self
        ref = Database.database().reference().child("InstaApp")
        //ref.queryLimited(toFirst: 100)
        var refhandle = ref.observe(DataEventType.value , with: {(snapshot) in
            self.getContent(content: snapshot.value as? [String : AnyObject] ?? [:])
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getContent(content: Dictionary<String,AnyObject>){
        if(!content.isEmpty){
            for(kind, numbers) in content {
                let singleUser = numbers
                if(singleUser["title"] != nil && singleUser["image"] != nil){
                    itemText.append(singleUser["title"] as! String)
                    itemLink.append(singleUser["image"] as! String)
                }
            }
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //like recyclerview onbind viewholder
        let cell : CustomTableViewCell =
            self.tableView.dequeueReusableCell(withIdentifier: "custom")
                as! CustomTableViewCell
        //intexpath is item position
        cell.itemLabel.text = itemText[indexPath.row]
        cell.itemImage.sd_setImage(with: URL(string: itemLink[indexPath.row]))
        return cell
    }

}

