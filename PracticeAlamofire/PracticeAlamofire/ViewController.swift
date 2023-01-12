//
//  ViewController.swift
//  PracticeAlamofire
//
//  Created by 김태현 on 2023/01/12.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var albumTitle: UILabel!
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func BtnPressed(_ sender: Any) {
        GetAlbumDataService.shared.getAlbumInfo { response in
            switch (response) {
            case .success(let albumData):
                if let data = albumData as? AlbumDataModel {
                    self.idLabel.text = String(data.id)
                    self.albumTitle.text = data.title
                    print("hreeeeeee")
                }
            case .requestErr(let message):
                print("requestErr", message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serveErr")
            case .networkFail:
                print("networkFail")
            }
        }
        
    }
    
}

extension ViewController {
    func fetchFilms() {
        let request = AF.request("https://swapi.dev/api/films")
        
//        request.response
    }
}
