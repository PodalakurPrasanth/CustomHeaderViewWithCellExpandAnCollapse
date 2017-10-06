//
//  ViewController.swift
//  TableviewCellExpand
//
//  Created by prasanth.podalakur on 9/22/17.
//  Copyright © 2017 KelltontechSolutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ExpandableHeaderViewDelegate {
    @IBOutlet weak var homeTableview: UITableView!

    var sectionVal:Int?
    
    var sections = [
        Section(genre: "🦁 Animation",
                movies: ["The Lion King"],
                expanded: false),
        Section(genre: "💥 Superhero",
                movies: ["Guardians of the Galaxy"],
                expanded: false),
        Section(genre: "👻 Horror",
                movies: ["The Walking Dead"],
                expanded: false)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableview.delegate = self
        self.homeTableview.dataSource = self
        self.homeTableview.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let header = self.homeTableview.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView

        
        header.customInit(title:sections[section].genre, section: section, delegate: self)
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded) {
            return 44
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded) {
            return 44
        } else {
            return 0
        }
    }
    func toggleSection(header: HeaderView, section: Int) {
        print(section)
        sections[section].expanded = !sections[section].expanded
        homeTableview.beginUpdates()
        
            homeTableview.reloadRows(at: [IndexPath(row: 0, section: section)], with: .automatic)
      
        homeTableview.endUpdates()
//        self.sectionVal = section
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

//     let section = ["pizza", "deep dish pizza", "calzone"]
    
//     let items = [["Margarita", "BBQ Chicken", "Peproni","Margarita", "BBQ Chicken", "Peproni","Margarita", "BBQ Chicken", "Peproni"], ["sausage", "meat lovers", "veggie lovers"], ["sausage", "chicken pesto", "prawns & mashrooms","Margarita", "BBQ Chicken", "Peproni","Margarita", "BBQ Chicken", "Peproni"]]

//     @IBOutlet weak var homeTableview: UITableView!
//     override func viewDidLoad() {
//         super.viewDidLoad()
//         homeTableview.delegate = self
//         homeTableview.dataSource = self
//         homeTableview.separatorStyle = .none
//          //homeTableview.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
//         // Do any additional setup after loading the view, typically from a nib.
//     }

//     override func didReceiveMemoryWarning() {
//         super.didReceiveMemoryWarning()
//         // Dispose of any resources that can be recreated.
//     }
//      func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//         return self.section[section]
//     }
//      func numberOfSections(in tableView: UITableView) -> Int {
//         return section.count
//     }
//      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         return items[section].count
//     }
//     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//         return 40
//     }
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
//         cell.nameLabel.text = self.items[indexPath.section][indexPath.row]
//         return cell
//     }
    
    
    
    
    

// }










