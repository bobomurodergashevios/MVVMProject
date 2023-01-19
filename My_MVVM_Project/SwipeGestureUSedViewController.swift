//
//  SwipeGestureUSedViewController.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 13/01/23.
//

import UIKit


class SwipeGestureUSedViewController: UIViewController {
    private var swipeableView: UIView!
     

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        swipeableView = UIView(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: self.view.frame.height))
                    
        swipeableView.backgroundColor = .red
        
        view.backgroundColor = UIColor(hex: "#F7F7F7")
//        view.alpha = 0.1
        
        // Add to View Hierarchy
        view.addSubview(swipeableView)
//        let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
        swipeableView.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))


    }
   
    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        // Initialize Swipe Gesture Recognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))

        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizer.direction = direction

        return swipeGestureRecognizer
    }
   
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        // Current Frame
        var frame = swipeableView.frame

        switch sender.direction {
        case .up:
            let dimmedHeight = self.view.frame.height-frame.maxY+70
            UIView.animate(withDuration: 0.2, delay: 0.0) {
                frame.origin.y += dimmedHeight
                frame.origin.y = max(0.0, frame.origin.y)
            }
        case .down:
            let dimmedHeight = self.view.frame.height-frame.maxY
            let downHeight = frame.maxY
            UIView.animate(withDuration: 0.2, delay: 0.0) {
//                frame.origin.y += 100.0

                if frame.maxY > self.view.bounds.maxY {
                    frame.origin.y += downHeight
                    frame.origin.y = max(0.0, frame.origin.y)
//                    self.dismiss(animated: true)
    //                frame.origin.y = view.bounds.height - frame.height
                }
            }
        case .left:
            frame.origin.x -= 100.0
            frame.origin.x = max(0.0, frame.origin.x)
        case .right:
            frame.origin.x += 100.0

            if frame.maxX > view.bounds.maxX {
                frame.origin.x = view.bounds.width - frame.width
            }
        default:
            break
        }

        UIView.animate(withDuration: 0.25) {
            self.swipeableView.frame = frame
        }
    }
//    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
//        // Current Frame
//        var frame = swipeableView.frame
//
//        print(sender.state)
//        switch sender.direction {
//        case .up:
//            frame.origin.y -= 100.0
//            frame.origin.y = max(0.0, frame.origin.y)
//        case .down:
//            frame.origin.y += 100.0
//
//            if frame.maxY > view.bounds.maxY {
//                frame.origin.y = view.bounds.height - frame.height
//            }
//        case .left:
//            frame.origin.x -= 100.0
//            frame.origin.x = max(0.0, frame.origin.x)
//        case .right:
//            frame.origin.x += 100.0
//
//            if frame.maxX > view.bounds.maxX {
//                frame.origin.x = view.bounds.width - frame.width
//            }
//        default:
//            break
//        }
//
//        UIView.animate(withDuration: 0.25) {
//            self.swipeableView.frame = frame
//        }
//    }
}
