////
////  CommentTableVc.swift
////  BlogAPI
////
////  Created by Bogdan Dubiahin on 19.03.2018.
////  Copyright © 2018 Bogdan Dubiahin. All rights reserved.
////
//
//import UIKit
//
//class CommentTableVc: UITableViewController {
//
//     var comment: BlogComment?
//
//    @IBOutlet weak var nameTableLabel: UILabel!
//    @IBOutlet weak var dateTableLable: UILabel!
//    @IBOutlet weak var commentTableLable: UILabel!
//
//
//    var parser = XMLParser()
//    var blogPosts: [BlogComment] = []
//
//    var eName = String()
//    var postTitle = String()
//    var postLink = String()
//    var descriptionText = String()
//    var postDate = String()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        navigationController?.navigationBar.tintColor = UIColor.white
//        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavigationBarBackground"), for: .default)
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white, NSAttributedStringKey.font:UIFont(name: "HelveticaNeue-Light", size: 18)!]
//        navigationController?.navigationBar.shadowImage = UIImage()
//
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableViewAutomaticDimension
//
//        let url = URL(string: "http://fed-blog.herokuapp.com/api/v1/comments")
//        //        var url: URL = URL.URLWithString("https://developer.apple.com/swift/blog/news.rss")!
//        parser = XMLParser(contentsOf: url!)!
//        parser.delegate = self
//        parser.parse()
//
//        //let contents = String.init(contentsOf: url!, encoding: String.Encoding(rawValue: 0))
//        //        let contents = String(contentsOf: url, encoding: 0, error: nil)
//        
//    }
//
//    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
//        eName = elementName
//        if elementName == "item" {
//            postTitle = String()
//            postLink = String()
//            descriptionText = String()
//            postDate = String()
//        }
//    }
//
//    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if elementName == "item" {
////            let blogPost: BlogComment
////            blogPost.author = postTitle
////            blogPost.datePublic = postLink
////            blogPost.id = descriptionText
////            blogPost.text = postDate
////            blogPosts.append(blogPost)
//        }
//    }
//
//
//    func parser(_ parser: XMLParser, foundCharacters string: String) {
//        let data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
//        //let data = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
//
//        if (!data.isEmpty) {
//            if eName == "title" {
//                postTitle += data
//            } else if eName == "link" {
//                postLink += data
//            } else if eName == "description" {
//                descriptionText += data
//            } else if eName == "pubDate" {
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "EEE, dd LLL yyyy HH:mm:ss zzz"
//                dateFormatter.timeZone = TimeZone(abbreviation: "PDT")
//                let formattedDate = dateFormatter.date(from: data)
//                if formattedDate != nil {
//                    dateFormatter.dateStyle = .medium
//                    dateFormatter.timeStyle = .none
//                    postDate = dateFormatter.string(from: formattedDate!)
//                }
//            }
//        }
//    }
//
//
//
//
//
//
////    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////
////        return (self.comment?.text.count)!
////    }
////
////    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let name = nameTableLabel
////        let date = dateTableLable
////        let commentt = commentTableLable
////
////        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellCell")! as UITableViewCell
////
////        cell.textLabel?.text = self.comment?.text
////        cell.detailTextLabel?.text = String(describing: comment?.id)
////
////
////        return cell
////    }
//
//}
//

