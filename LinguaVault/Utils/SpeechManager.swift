//
//  SpeechManager.swift
//  LinguaVault
//
//  Created by Mohamad Mohamad on 27/02/2025.
//


import AVFoundation

class SpeechManager {
    static let shared = SpeechManager() // Singleton instance

    private let synthesizer = AVSpeechSynthesizer()

    private init() {} // Private initializer to prevent multiple instances

    func speak(text: String, language: String = "en-US") {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = 0.4 // Adjust speed if needed

        synthesizer.speak(utterance)
    }
}
