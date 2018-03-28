//
//  CardsViewController.swift
//  Tinder
//
//  Created by Joe Antongiovanni on 3/27/18.
//  Copyright © 2018 Joe Antongiovanni. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didMoveCard(_ sender: UIPanGestureRecognizer) {
        //let location = sender.location(in: view)
        //let velocity = sender.velocity(in: view)
        //let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
        } else if sender.state == .changed {
            print("Gesture is changing")
        } else if sender.state == .ended {
            print("Gesture ended")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
