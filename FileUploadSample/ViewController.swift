//
//  ViewController.swift
//  FileUploadSample
//
//  Created by hiraya.shingo on 2017/03/13.
//  Copyright © 2017年 shingohry. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapButton(_ sender: Any) {
        upload()
    }
    
    func upload() {
        let path = Bundle.main.path(forResource: "image", ofType: "png")
        let fileURL = URL.init(fileURLWithPath: path!)
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(fileURL, withName: "file")
        },
            to: "http://192.168.10.52:8080/",
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        debugPrint(response)
                    }
                case .failure(let encodingError):
                    print(encodingError)
                }
        }
        )
    }
}

