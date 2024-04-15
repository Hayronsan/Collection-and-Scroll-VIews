//
//  HomeViewController.swift
//  Collection and Scroll VIews
//
//  Created by Nodir on 13/04/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let numberOfColumns: CGFloat = 2
    var items: Array<Item> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()

    }


//    Mark: - Method
    
    func initViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        addNavigationBar()
        
        self.collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWith = screenSize.width / numberOfColumns - 15
            flowLayout.itemSize = CGSize(width: cellWith, height: cellWith)
        }
        
        items.append(Item(title: "Best Coding", image: "image1"))
        items.append(Item(title: "Amazing Code", image: "image2"))
        items.append(Item(title: "Best Coding", image: "image1"))
        items.append(Item(title: "Amazing Code", image: "image2"))
        items.append(Item(title: "Best Coding", image: "image1"))
        items.append(Item(title: "Amazing Code", image: "image2"))
        items.append(Item(title: "Best Coding", image: "image1"))
        items.append(Item(title: "Amazing Code", image: "image2"))
        
    }
    
    func addNavigationBar(){
        let scroll = UIImage(named: "ic_scroll")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(rightTapped))
        title = "Collection View"
    }
    
    func callScrollView(){
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
//    Mark: - Action
    
    @objc func rightTapped(){
        callScrollView()
    }
    
    
    
//    Mark: - Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.imageView.image = UIImage(named: item.image!)
        cell.nameLabel.text = item.title
        
        return cell
    }

}
