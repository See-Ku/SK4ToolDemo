//
//  AudioPlayerViewController.swift
//  SK4ToolDemo
//
//  Created by See.Ku on 2016/04/18.
//  Copyright (c) 2016 AxeRoad. All rights reserved.
//

import UIKit
import SK4SpareKit

/// 効果音用enum
enum SoundEffect: String, SK4AudioPlayer {
	case Gyuuuuuu
	case Purururururu
}

class AudioPlayerViewController: UIViewController {

	@IBOutlet weak var numberLabel: UILabel!
	@IBOutlet weak var numberStepper: UIStepper!

	@IBAction func onPlay(sender: AnyObject) {
		let no = Int(numberStepper.value)
		numberLabel.text = "No.\(no)"

		// nameを指定して再生
		let name = String(format: "powerup%02d", no)
		let admin = SK4AudioPlayerAdmin.defaultAdmin
		admin.play(name)
	}

	@IBAction func onGyuuuuuu(sender: AnyObject) {

		// enum経由で再生
		SoundEffect.Gyuuuuuu.play()
	}

	@IBAction func onPurururururu(sender: AnyObject) {
		SoundEffect.Purururururu.play()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// eof
