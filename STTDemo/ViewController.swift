//
//  ViewController.swift
//  STTDemo
//
//  Created by 邓先舜 on 2023/4/14.
//

import UIKit
import Speech
import Player
import SnapKit
import AVFoundation

class ViewController: UIViewController {
    
    private var player: Player?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.player = Player()
        self.player!.playerDelegate = self
        self.player!.playbackDelegate = self
        self.addChild(self.player!)
        self.view.addSubview(self.player!.view)
        self.player!.didMove(toParent: self)
        self.player!.view.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.left.right.equalTo(0)
            make.height.equalTo(300)
        }
        
        self.player?.view.backgroundColor = .black
        self.player?.fillMode = AVLayerVideoGravity.resize
        self.player?.url = URL(string: "https://v.cdn.vine.co/r/videos/AA3C120C521177175800441692160_38f2cbd1ffb.1.5.13763579289575020226.mp4")
        self.player?.playFromBeginning()
    }
    
    @IBAction func selectVideo(_ sender: Any) {
    }
    
    @IBAction func start(_ sender: Any)  {
        let status = SFSpeechRecognizer.authorizationStatus()
        if (status == .notDetermined) {
            SFSpeechRecognizer.requestAuthorization { status in
                
            }
        }
        let avStatus = AVCaptureDevice.authorizationStatus(for: .audio)
        if avStatus == .notDetermined {
            AVCaptureDevice.requestAccess(for: .audio, completionHandler: {_ in })
        }
        
    }
    
    func setupSpeech() async -> Void {
        print("start setup")
        let task = Task { () -> SFSpeechRecognizerAuthorizationStatus in
            sleep(3)
            if ("".isEmpty) {
                throw TaskError(0, "1");
            }
            return SFSpeechRecognizer.authorizationStatus();
        }
        do {
            let s = try await task.value;
            print("start setup finsh \(String(describing: s))")
        } catch  {
            print("fucking error \(error)")
        }
    }
}

class TaskError: Error {
    init(_ c: Int, _ m: String) {
        code = c;
        msg = m;
    }
    public var code: Int;
    public var msg: String;
}

extension ViewController: PlayerDelegate {
    func playerReady(_ player: Player) {
        
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
        
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
        
    }
    
    func player(_ player: Player, didFailWithError error: Error?) {
        
    }
}

extension ViewController: PlayerPlaybackDelegate {
    func playerCurrentTimeDidChange(_ player: Player) {
        
    }
    
    func playerPlaybackWillStartFromBeginning(_ player: Player) {
        
    }
    
    func playerPlaybackDidEnd(_ player: Player) {
        
    }
    
    func playerPlaybackWillLoop(_ player: Player) {
        
    }
    
    func playerPlaybackDidLoop(_ player: Player) {
        
    }
    
    
}
