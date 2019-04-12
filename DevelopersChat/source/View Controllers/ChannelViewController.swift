//
//  ChannelViewController.swift
//  DevelopersChat
//
//  Created by stag on 11/04/19.
//  Copyright © 2019 Gabriel Silva. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore

class ChannelViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionViewChannel: UICollectionView! {
        didSet {
            collectionViewChannel.delegate = self
            collectionViewChannel.dataSource = self
        }
    }
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    private let db = Firestore.firestore()
    
    private var channelReference: CollectionReference {
        return db.collection("channels")
    }
    
    private var channels: [Channel] = []
    private var channelListener: ListenerRegistration?
    
    deinit {
        channelListener?.remove()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Channes"

        self.nameLabel.text = UserDefaults.standard.string(forKey: "username")
        
        loadChannels()
        
    }
    
    func loadChannels() {
        channelListener = channelReference.addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error listening for channel updates: \(error?.localizedDescription ?? "No error")")
                return
            }
            
            let data = snapshot.documents.compactMap({ Channel(name: $0.data()["name"] as! String)})
            
                self.channels = data

            
            
            
//            snapshot.documentChanges.forEach { change in
//                guard let channel = Channel(document: change.document) else { return }
//
//                let data = change.document.data()
//                guard let name = data["name"] as? String else { return }
//                self.channels.append(Channel(name: name))
//            }
            
            self.collectionViewChannel.reloadData()
//            print("PRINT AQUI >>>>>>  \(self.channels.count)")
        }
        
    }
}

extension ChannelViewController: UICollectionViewDelegate {}

extension ChannelViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChannelCollectionViewCell", for: indexPath) as? ChannelCollectionViewCell {
            cell.loadChannels(channel: channels[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(channels[indexPath.item].name)")
    }
}


extension ChannelViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: collectionWidth, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}
