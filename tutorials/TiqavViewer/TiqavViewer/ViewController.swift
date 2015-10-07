//
//  ViewController.swift
//  TiqavViewer
//
//  Created by Masahiko Okada on 2015/10/06.
//
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSURLConnectionDelegate {
    // MARK: Property
    @IBOutlet weak var tableView: UITableView!
    
    let baseUrl = "http://img.tiqav.com/"
    var tiqavs = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 移譲
        // ここか storyboard で delegate, dataSource を指定しないと tableView が動作しない
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = "tiqav images"
        self.reload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tiqavs.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TiqavCell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as! TiqavCell
        
        let imageUrl = tiqavs[indexPath.row] as String
        
        cell.tiqavUrlLabel.text = imageUrl
        cell.tiqavImageView.image = nil
        
        let q_global: dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        let q_main: dispatch_queue_t = dispatch_get_main_queue()
        
        // 非同期処理: バックグラウンドで画像データの取得などを実行
        dispatch_async(q_global, {
            let imageURL: NSURL = NSURL(string: imageUrl)!
            let imageData: NSData = NSData(contentsOfURL: imageURL)!
            
            let image: UIImage = UIImage(data: imageData)!
            
            // 非同期処理: メインスレッドに戻って UI を更新
            dispatch_async(q_main, {
                cell.tiqavImageView.image = image
                cell.layoutSubviews()
            })
        })
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let text: String = tiqavs[indexPath.row]
        
        // show alert
        let alert = UIAlertController(title: "taped", message: text, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "close", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }


    func reload() {
        let url = NSURL(string: "http://api.tiqav.com/search/random.json")!
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithURL(url, completionHandler: self.fetchResponse)
        task.resume()
    }
    
    func fetchResponse(data: NSData?, resp: NSURLResponse?, error: NSError?) {
        var json: NSArray = NSArray()

        do {
            json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSArray
        } catch {
            print("error")
        }
        
        tiqavs = [String]()
        
        for img in json {
            let imgId = img["id"] as! String
            let ext = img["ext"] as! String
            
            let imageUrl = (baseUrl + imgId + "." + ext) as String
            tiqavs.append(imageUrl)
        }
        
        // 非同期で tableView を更新する
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
        })
    }

    @IBAction func tappedRequestButton(sender: UIBarButtonItem) {
        self.reload()
        // 先頭にスクロールして戻す
        self.tableView.scrollRectToVisible(CGRect(x:0 , y: 0, width: 1,height:1), animated: true)
    }

}

