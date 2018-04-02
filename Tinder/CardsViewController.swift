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
    var divisor: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didMoveCard(_:)))
        card.isUserInteractionEnabled = true
        card.addGestureRecognizer(panGestureRecognizer)
        // Do any additional setup after loading the view.
        
        divisor = (view.frame.width / 2)/0.61
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first!
        let location = touch.location(in: card)
        print(location.x)
        print(location.y)
    }
    @IBAction func didTapCard(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "cardTap", sender: self)
    }
    
    @IBAction func didMoveCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x

        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
        print(xFromCenter)

        if sender.state == .began {
            print("Gesture began")
            cardCenter = card.center
        } else if sender.state == .changed {
            print("Gesture is changing")
            card.center = CGPoint(x: cardCenter.x + translation.x, y: cardCenter.y)
            
        } else if sender.state == .ended {
            print("Gesture ended")
            
            if (card.center.x < 75){
                UIView.animate(withDuration: 0.3, animations: {
                    self.card.alpha = 0
                    self.card.center = CGPoint(x: self.card.center.x - 150, y: self.card.center.y)
                }){(Bool) in
                    self.resetCard()
                }
                return
            }else if (card.center.x > (view.frame.width - 75)) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.card.alpha = 0
                    self.card.center = CGPoint(x: self.card.center.x + 150, y: self.card.center.y)
                }){(Bool) in
                    self.resetCard()
                }
                return
                //resetCard()
                }
        resetCard()
        }
    }
    
    func resetCard() {
        self.card.transform = CGAffineTransform.identity
        self.card.center = self.view.center
        self.card.alpha = 1
        

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
