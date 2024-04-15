//
//  ScrollViewController.swift
//  Collection and Scroll VIews
//
//  Created by Nodir on 13/04/24.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()

    }


//   Mark: - Method
    
    func initViews(){
        addNavigationBar()
    }
    
    func addNavigationBar(){
        let back = UIImage(named: "ic_back")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(rightTapped))
        title = "Scroll View"
    }
    
    
//    Mark: - Action
    
    @objc func rightTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
//    Mark: -
    
    

}

