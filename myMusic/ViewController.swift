//
//  ViewController.swift
//  myMusic
//
//  Created by Sakurako Shimbori on 2020/06/23.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //シンバルの音源ファイルを指定
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")


    //シンバル用のプレイヤーインスタンスを作成
    var cymbalPlayer = AVAudioPlayer()
    
    @IBAction func cymbal(_ sender: Any) {
        soundPlayer(player: &cymbalPlayer, path: cymbalPath, count: 0)
    }
    //ギター用のプレイヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()
    //ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")

    @IBAction func guitar(_ sender: Any) {
        soundPlayer(player: &guitarPlayer, path: guitarPath, count: 0)
    }
    //バックミュージックの音源ファイルを指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    //バックミュージック用のプレイヤーインスタンスを作成
    var backmusicPlayer = AVAudioPlayer()
    @IBAction func play(_ sender: Any) {
        soundPlayer(player: &backmusicPlayer, path: backmusicPath, count: -1)
    }
    @IBAction func stop(_ sender: Any) {
        //バックミュージックを停止
        backmusicPlayer.stop()
    }
    //共通のプレイヤー再生処理
    fileprivate func soundPlayer(player:inout AVAudioPlayer,path:URL,count:Int){
        do{
            player = try AVAudioPlayer(contentsOf: path,fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        }catch{
            print("エラーが発生しました")
        }
    }
    
}

