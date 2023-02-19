//
//  BotResponse.swift
//  HelpLink
//
//  Created by Soham Phadke on 2/18/23.
//

import Foundation


func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") {
        return "Hey there!"
    } else if tempMessage.contains("goodbye") {
        return "Talk to you later!"
    } else if tempMessage.contains("how are you") {
        return "I'm fine, how about you?"
    } else {
        return "That's cool."
    }
}




func fetch(msg: String) -> String {
    let url = URL(string: "https://api.openai.com/v1/completions")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer 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", forHTTPHeaderField: "Authorization")

    let parameters: [String: Any] = [
        "model": "text-davinci-003",
        "prompt": msg,
        "temperature": 0.7,
        "max_tokens": 20,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
    ]

    request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

    let semaphore = DispatchSemaphore(value: 0)

    var completionResult: String?

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            semaphore.signal()
            return
        }
        
        if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let choices = responseJSON["choices"] as? [[String: Any]],
           let firstChoice = choices.first,
           let text = firstChoice["text"] as? String {
            completionResult = text
        }
        
        semaphore.signal()
    }

    task.resume()

    _ = semaphore.wait(timeout: .distantFuture)
    
    return completionResult?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Sorry I did not get a response"
}
