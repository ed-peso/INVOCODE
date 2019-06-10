//
//  ReceiptsTableViewController.swift
//  INVOCODEFINAL
//
//  Created by Edward Bonsu on 04/06/2019.
//  Copyright © 2019 Edward Bonsu. All rights reserved.

import UIKit

struct Headline {
    
    var id : Int
    var date : Date
    var title : String
    var text : String
    var image : String
    
}

fileprivate func parseDate(_ str : String) -> Date {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "yyyy-MM-dd"
    return dateFormat.date(from: str)!
}

fileprivate func firstDayOfMonth(date : Date) -> Date {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month], from: date)
    return calendar.date(from: components)!
}

class ReceiptsTableViewController: UITableViewController {
    
    var headlines = [
        Headline(id: 1, date: parseDate("2018-02-15"), title: "EE", text: "£61.00 Offer savings tips", image: "eelogo"),
        Headline(id: 2, date: parseDate("2018-03-05"), title: "Netflix", text: "£15.99 Offer savings tips", image: "netflixlogo"),
        Headline(id: 3, date: parseDate("2018-02-10"), title: "Shell", text: "£43.00 Offer savings tips", image: "shell_logo"),
        Headline(id: 4, date: parseDate("2018-05-15"), title: "Starbucks", text: "£10.00 Offer savings tips", image: "starbucks"),
    ]
    
    var sections = [TableSection<Date, Headline>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sections = TableSection.group(rowItems: self.headlines, by: { (headline) in
            return firstDayOfMonth(date: headline.date)
        })
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        let date = section.sectionItem
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.rowItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let section = self.sections[indexPath.section]
        let headline = section.rowItems[indexPath.row]
        cell.textLabel?.text = headline.title
        cell.detailTextLabel?.text = headline.text
        cell.imageView?.image = UIImage(named: headline.image)
        
        return cell
    }
    
}
