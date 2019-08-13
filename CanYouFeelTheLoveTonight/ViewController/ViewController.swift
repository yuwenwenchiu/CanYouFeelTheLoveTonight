//
//  ViewController.swift
//  CanYouFeelTheLoveTonight
//
//  Created by Yuwen Chiu on 2019/8/9.
//  Copyright © 2019 YuwenChiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let lyrics = [Lyrics(text: "So many things to tell her. But how to make her see? The truth about my past, impossible. She'd turn away from me.", name: "simba"), Lyrics(text: "He's holding back, he's hiding. But what, I can't decide. Why won't he be the king I know he is? The king I see inside?", name: "nala"), Lyrics(text: "Can you feel the love tonight? The peace the evening brings.", name: "simba"), Lyrics(text: "The world, for once, in perfect harmony. With all its living things.", name: "nala"), Lyrics(text: "Can you feel the love tonight? You needn't look too far.", name: "nala"), Lyrics(text: "Stealing through the night's uncertainties. Love is where they are.", name: "simba"), Lyrics(text: "And if he feels the love tonight. In the way I do", name: "nala"), Lyrics(text: "It's enough for this restless wanderer.", name: "simba"), Lyrics(text: "Just to be with you.", name: "simba"), Lyrics(text: "Just to be with you.", name: "nala")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        let simbaXib = UINib(nibName: "simbaCell", bundle: nil)
        tableView.register(simbaXib, forCellReuseIdentifier: "simba")
        let nalaXib = UINib(nibName: "nalaCell", bundle: nil)
        tableView.register(nalaXib, forCellReuseIdentifier: "nala")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return lyrics.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let showLyrics = lyrics[indexPath.row]
        
        if showLyrics.name == "simba" {
            
            let simbaCell = tableView.dequeueReusableCell(withIdentifier: "simba", for: indexPath) as! simbaCell
            simbaCell.simbaTextView?.text = showLyrics.text
            
            return simbaCell
            
        } else {
            
            let nalaCell = tableView.dequeueReusableCell(withIdentifier: "nala", for: indexPath) as! nanaCell
            nalaCell.nalaTextView?.text = showLyrics.text
            
            return nalaCell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
        
   }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let nalaCell = cell as? nanaCell else {
            
            guard let simbaCell = cell as? simbaCell else { return }
            simbaCell.layoutIfNeeded()
            simbaCell.simbaChatBubble()
            print("simba ok")
    
            return
            
        }
        
        nalaCell.layoutIfNeeded()
        nalaCell.nalaChatBubble()
        print("nala ok")
        
    }
    
}
