//
//  MoviesViewController.swift
//  Project
//
//  Created by Aykut Doğru on 14.12.2019.
//  Copyright © 2019 Aykut Doğru. All rights reserved.
//

import UIKit
import Alamofire

class MoviesViewController: UIViewController {
	
	@IBOutlet weak var moviesCollectionView: UICollectionView!
	@IBOutlet weak var popularMoviesCollectionView: UICollectionView!
	@IBOutlet weak var scrollView: UIScrollView!

	var movieModelArray: [Results] = []
	var populerArray: [Results] = []
	var commentArray: [Results] = []

	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.setUp()
		self.getData()
    }

	func setUp() {
		self.moviesCollectionView.register(UINib(nibName: "MoviesCollectionCell", bundle: nil), forCellWithReuseIdentifier: "MoviesCollectionCell")
		self.popularMoviesCollectionView.register(UINib(nibName: "PopulerViewCell", bundle: nil), forCellWithReuseIdentifier: "PopulerViewCell")
		self.scrollView.contentOffset = CGPoint(x: 0, y: 700)
	}
	
	/// Get Request
	func getData() {
		let url = "http://www.mocky.io/v2/5dea8d843000001d442b09da"
		APIManager.shared.fetchData(url) { (success, response) in
			if success {
				let json = response.data
				
				do {
					let decoder = JSONDecoder()
					self.movieModelArray = try decoder.decode([Results].self, from: json!)
					self.setArray(with: self.movieModelArray)
					
				} catch {
					print("Error")
				}
			}
		}
	}
	
	func setArray(with result: [Results]) {
		for i in 0..<movieModelArray.count {
			if movieModelArray[i].isPopular == true {
				populerArray.append(movieModelArray[i])
			}
			if movieModelArray[i].isRecommended == true {
				commentArray.append(movieModelArray[i])
			}
		}
		self.moviesCollectionView.reloadData()
		self.popularMoviesCollectionView.reloadData()
	}
}

// Collection View Delegates

extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if collectionView == popularMoviesCollectionView {
			return populerArray.count-1
		}
		return commentArray.count-1
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if collectionView == moviesCollectionView {
			let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionCell", for: indexPath) as! MoviesCollectionCell
			let item = commentArray[indexPath.row]
			cell.config(with: item)
			return cell
		}
		
		if collectionView == popularMoviesCollectionView {
			let cell2 = popularMoviesCollectionView.dequeueReusableCell(withReuseIdentifier: "PopulerViewCell", for: indexPath) as! PopulerViewCell
			let item = populerArray[indexPath.row]
			cell2.configure(with: item)
			return cell2
		}
		return UICollectionViewCell()
	}
}

