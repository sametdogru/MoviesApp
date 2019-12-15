//
//  ViewController.swift
//  Project
//
//  Created by Aykut Doğru on 14.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController  {

	@IBOutlet weak var storiesCollectionView: UICollectionView!
	@IBOutlet weak var tableViewContent: UITableView!

	var postModelArray: [Response] = []
	var postModelArray2: [Response] = []
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		getData()
        tableViewContent.register(UINib(nibName: "cellType1", bundle: nil), forCellReuseIdentifier: "cellType1")
        tableViewContent.register(UINib(nibName: "cellType2", bundle: nil), forCellReuseIdentifier: "cellType2")

	}
	
	/// Get Request
	func getData() {
		let url = "http://www.mocky.io/v2/5dea8bf6300000d23f2b09d0"
		APIManager.shared.fetchData(url) { (success, response) in
			if success {
				let json = response.data
				do {
					let decoder = JSONDecoder()
					self.postModelArray = try decoder.decode([Response].self, from: json!)
					self.postModelArray2 = self.postModelArray
					self.storiesCollectionView.reloadData()
					self.tableViewContent.reloadData()

				} catch {
					print("error")
				}
			} else {
				print("error")
			}
		}
	}
}

// Table View Delegates
extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if postModelArray2[indexPath.row].likeCount > 20 {
			return 500
		} else {
			return 153
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return postModelArray2.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			
		if postModelArray2[indexPath.row].likeCount > 20 {
			let cell2 = tableViewContent.dequeueReusableCell(withIdentifier: "cellType2", for: indexPath) as! cellType2
			let item = postModelArray2[indexPath.row]
			cell2.configure(with: item)
			return cell2
		} else {
			let cell1 = tableViewContent.dequeueReusableCell(withIdentifier: "cellType1", for: indexPath) as! cellType1
			let item = postModelArray2[indexPath.row]
			cell1.configure(with: item)
			return cell1
		}
	}
}

// Collection View Delegates
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return postModelArray.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! StoriesCollectionViewCell
		if indexPath.row == 0 {
			cell.userImage.image = UIImage(named: "group2")
			cell.userFullName.text = "You"
		} else {
			cell.configure(postModelArray[indexPath.row].userImageUrl, userFullName: postModelArray[indexPath.row].userFullName)
		}
		
		if indexPath.row == 1 {
			cell.liveImage.isHidden = false
		}
		return cell
	}
}
