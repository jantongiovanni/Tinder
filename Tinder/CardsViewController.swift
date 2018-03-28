//
//  CardsViewController.swift
//  Tinder
//
//  Created by Joe Antongiovanni on 3/27/18.
//  Copyright © 2018 Joe Antongiovanni. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var card: UIImageView!
    var cardCenter: CGPoint!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didMoveCard(_:)))
        card.isUserInteractionEnabled = true
        card.addGestureRecognizer(panGestureRecognizer)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didMoveCard(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            cardCenter = card.center
        } else if sender.state == .changed {
            print("Gesture is changing")
            card.center = CGPoint(x: cardCenter.x + translation.x, y: cardInitialCenter.y)

            //card.transform = CGAffineTransform()
            
           // card.transform = view.transform.rotated(by angle: CGFloat(45 * M_PI / 180))

        } else if sender.state == .ended {
            print("Gesture ended")
            card.transform = cardInitialCenter        }
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
