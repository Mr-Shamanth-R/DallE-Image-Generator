//
//  ViewController.swift
//  DallE_Image_Generator
//
//  Created by Shamanth R on 16/05/23.
//

import UIKit
import OpenAIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
 
    @IBOutlet weak var imageText: UILabel!
    
    let model = ImageGenerator()
    let requiredText  = "Flying car on mars."
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.setup()
        doRegularWork()
    }
    
    func doAsyncWork() async {
        imageView.image = await model.generateImage(from: requiredText)
        imageText.text = requiredText
    }

    func doRegularWork() {
        Task {
            await doAsyncWork()
        }
    }
    
}

