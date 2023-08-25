//
//  ImageGenerator.swift
//  DallE_Image_Generator
//
//  Created by Shamanth R on 16/05/23.
//

import UIKit
import OpenAIKit

class ImageGenerator {
    
    
    private var openAI: OpenAI?
    let apiKey = "Apikey"
    
    func setup() {
        openAI = OpenAI(
            Configuration(
                organizationId: "Personal",
                apiKey: apiKey
            )
        )
    }

    func generateImage(from prompt: String) async -> UIImage? {
        guard let openAI = openAI else {
            return nil
        }
        
        let imageParameters = ImageParameters(
            prompt: prompt,
            resolution: .medium,
            responseFormat: .base64Json
        )
    
        do {
            let result = try await openAI.createImage(parameters: imageParameters)
            let imageData = result.data[0].image
            let image = try openAI.decodeBase64Image(imageData)
            return image
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }


}
