//
//  ViewController.swift
//  JSONpractice
//
//  Created by Ndel on 7/20/19.
//  Copyright © 2019 Ndel. All rights reserved.
//

import UIKit

let urlBeginning = "https://api.github.com/users/"

let githubAccount = "ndelo3463"


struct GithubData: Codable {
    let name: String?
    let avatarURL: String?
    let location: String?
    let followers: Int?
    let publicRepos: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case avatarURL = "avatar_url"
        case location
        case followers
        case publicRepos = "public_repos"
        
    }

}

class ViewController: UIViewController {
    
    
    
    
    @IBAction func showInfo(_ sender: Any) {
    
        guard let gitUrl = URL(string: "https://api.github.com/users/" + (gitUname.text?.lowercased() ?? "") ) else { return }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(GithubData.self, from: data)
                print(gitData.name)
                print(gitData.publicRepos)
            } catch let err {
                print("Error", err)
            }
        }.resume()

    }
    
    
    @IBOutlet weak var gitUname: UITextField!
    
  
    
    
   
    
}









