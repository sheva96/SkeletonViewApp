//
//  TableViewController.swift
//  SkeletonViewApp
//
//  Created by Yevhen Shevchenko on 14.01.2021.
//

import UIKit
import SkeletonView

class TableViewController: UITableViewController, SkeletonTableViewDataSource {
    
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            for _ in 0..<20 {
                self.data.append("Some Text")
            }
            self.tableView.stopSkeletonAnimation()
            self.tableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .gray), animation: nil, transition: .crossDissolve(0.25))
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        "cell"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if !data.isEmpty {
            cell.customeImageView.image = UIImage(systemName: "star")
            cell.customeLabel.text = data[indexPath.row]
        }
        
        return cell
    }
    
}
