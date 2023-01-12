//
//  ViewController.swift
//  PracticeAlamofire
//
//  Created by 김태현 on 2023/01/12.
//

import UIKit
import Alamofire
import Kingfisher
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var albumTitle: UILabel!
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mainImage.isSkeletonable = true
        self.view.isSkeletonable = true
        self.view.showAnimatedSkeleton()
    }

    @IBAction func BtnPressed(_ sender: Any) {
        GetAlbumDataService.shared.getAlbumInfo { response in
            switch (response) {
            case .success(let albumData):
                if let data = albumData as? AlbumDataModel {
                    self.idLabel.text = String(data.id)
                    self.albumTitle.text = data.title
                    let thumbnailUrl = URL(string: data.thumbnailImageURL)
                    let imageUrl = URL(string: data.mainImageURL)
                    
//                    self.mainImage.kf.indicatorType = .activity
                    self.mainImage.kf.setImage(with: imageUrl, placeholder: nil, options: [.transition(.none),.forceTransition], progressBlock: { receivedSize, totalSize in
                        let percentage = (Float(receivedSize) / Float(totalSize)) * 100.0
                        print("이곳")
                        print(percentage)
                    },completionHandler: { _ in self.view.hideSkeleton() })
                    
                    self.thumbnailImage.kf.setImage(with: thumbnailUrl)
                    
//                    let imageUrl = URL(string: "https://t1.daumcdn.net/cfile/blog/136708454DF2C74141?original")
//                    do {
//                        let thumbnailData = try Data(contentsOf: thumbnailUrl!)
//                        self.thumbnailImage.image = UIImage(data: thumbnailData)
//                        let imageData = try Data(contentsOf: imageUrl!)
//                        self.mainImage.image = UIImage(data: imageData)
//                        print("hreeeeeee")
//                    } catch (let error) {
//                        print(error)
//                    }
                    
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
