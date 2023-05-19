//
//  SoundPlayer.swift
//  ArithmeticPuzzle
//
//  Created by 寒河江彪流 on 2023/05/20.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    // 音源データ名の変数
    let soundName: String
    // 音源データの変数
    let soundData: Data
    // プレイヤーの変数
    var soundPlayer: AVAudioPlayer!

    init(soundName: String) {
        // 音源データ名を取得
        self.soundName = soundName
        // 音源データの読み込み
        self.soundData = NSDataAsset(name: soundName)!.data
        // プレイヤーに音源をセット
        do {
            self.soundPlayer = try AVAudioPlayer(data: self.soundData)
        } catch {
            print("プレイヤーのインスタンス生成に失敗しました")
        } // プレイヤーに音源をセットここまで
    } // 初期化ここまで
    // 音源再生
    internal func soundPlay() {
        soundPlayer.play()
    }
} // SoundPlayerここまで
