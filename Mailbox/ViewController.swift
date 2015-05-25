//
//  ViewController.swift
//  Mailbox
//
//  Created by Brandon Souba on 5/18/15.
//  Copyright (c) 2015 BrandonSouba. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var horizontalScrollView: UIView!
    @IBOutlet weak var rightScrollView: UIView!
    @IBOutlet weak var leftScrollView: UIView!
    @IBOutlet weak var hamburgerMenu: UIImageView!
    @IBOutlet weak var moveRightView: UIView!
    @IBOutlet weak var rowBackground: UIView!
    @IBOutlet weak var composeView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var awesomeView: UIView!
    @IBOutlet weak var swipeView: UIView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var composerView: UIView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var flyingMessageView: UIView!
    @IBOutlet weak var checkIcon: UIImageView!
    @IBOutlet weak var rightIcons: UIView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var iconGroup: UIView!
    @IBOutlet weak var rescheduleView: UIImageView!
    @IBOutlet weak var rescheduleGroup: UIView!
    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var listGroupView: UIView!
    @IBOutlet weak var blackMessageView: UIView!
    @IBOutlet weak var compostButton: UIButton!
    @IBOutlet weak var listView: UIImageView!
    @IBOutlet weak var messageFieldView: UIImageView!
    @IBOutlet weak var newMessageView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    
    //    Screen edge recognizer
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    var currentRadius:CGFloat = 0.0
    
    
    var initialCenter: CGFloat!
    var rx:CGFloat!
    
    
    let greenColor = UIColor(red: 85/255, green: 213/255, blue: 80/255, alpha: 1)
    let grayColor = UIColor(red:178/255, green: 178/255, blue: 178/255, alpha:1)
    let redColor = UIColor(red:231/255, green: 61/255, blue: 14/255, alpha: 1)
    let yellowColor = UIColor(red:254/255, green: 202/255, blue: 22/255, alpha: 1)
    let brownColor = UIColor(red:206/255, green: 150/255, blue: 98/255, alpha: 1)
    let blueColor = UIColor(red:55/255, green: 175/255, blue: 215/255, alpha: 1)
    
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            segmentedControl.tintColor = yellowColor

            UIView.animateWithDuration((0.3), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.horizontalScrollView.center.x = 480

                }, completion: nil)
        case 1:
            segmentedControl.tintColor = blueColor

            UIView.animateWithDuration((0.3), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.horizontalScrollView.center.x = 160
                }, completion: nil)
        default:
            segmentedControl.tintColor = greenColor

            UIView.animateWithDuration((0.3), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.horizontalScrollView.center.x = -160
                }, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        
        
        
        
        //        Screen Edge recognizer
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,
            action: "moveMenu:")
        screenEdgeRecognizer.edges = .Left
        view.addGestureRecognizer(screenEdgeRecognizer)
        
        rowBackground.backgroundColor = self.grayColor
        checkIcon.alpha = 0
        deleteIcon.alpha = 0
        listIcon.alpha = 0
        laterIcon.alpha = 0
        rescheduleGroup.alpha = 0
        listGroupView.alpha = 0
        newMessageView.alpha = 0
        flyingMessageView.center.y = 1000
        blackMessageView.alpha = 0
        segmentedControl.tintColor = blueColor
        segmentedControl.selectedSegmentIndex = 1
        leftScrollView.center.x = -120
        rightScrollView.center.x = 520
        rightScrollView.center.y = 1033
        leftScrollView.center.y = 1033
        swipeView.alpha = 1
        navView.center.x = 160
        composerView.center.x = 160
        listGroupView.center.x = 160
        rescheduleView.center.x = 160




        
        let scrollPoint = CGPointMake(0, 80)
        
        
        scrollView.frame.size.height = 568;
        scrollView.contentSize = CGSize(width: 320, height: 1450)
        scrollView.setContentOffset(scrollPoint, animated: true)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        swipeView.frame.size.width = 320
        swipeView.center.x = 160
        println(swipeView.frame.width)
        self.horizontalScrollView.center.x = 160


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButton(sender: UIButton) {
        UIView.animateWithDuration((0.3), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.newMessageView.alpha = 0
            self.flyingMessageView.center.y = 1000
            self.blackMessageView.alpha = 0
            self.textField.resignFirstResponder()
            
            
            }, completion: nil)
        
        
    }
    @IBAction func compostButton(sender: UIButton) {
        UIView.animateWithDuration((0.3), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.newMessageView.alpha = 1
            self.flyingMessageView.center.y = 200
            self.blackMessageView.alpha = 0.5
            self.textField.becomeFirstResponder()
            
            }, completion: nil)
    }
    
    @IBAction func didPressReschedule(sender: UIButton) {
        UIView.animateWithDuration((0.3), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.rescheduleGroup.alpha = 0
            self.feedView.center.y = 700
            }, completion: nil)
        
    }
    
    @IBAction func didPressList(sender: UIButton) {
        UIView.animateWithDuration((0.3), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            self.listGroupView.alpha = 0
            self.feedView.center.y = 700
            }, completion: nil)
    }
    
    @IBAction func didSwipeEdge(sender: UIScreenEdgePanGestureRecognizer) {
        println("did swipe")
    }
    
    
    func moveMenu(sender: UIScreenEdgePanGestureRecognizer) {
        var location = sender.locationInView(view)
        var  translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = swipeView.center.x
        }
        if sender.state == UIGestureRecognizerState.Changed {
            swipeView.center.x = (initialCenter + translation.x)
        }
        
        if sender.state == UIGestureRecognizerState.Ended {
            
            println(self.swipeView.center.x)
            
            if translation.x < 120 {
                UIView.animateWithDuration((0.3), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.swipeView.center.x = self.initialCenter
                    }, completion: nil)
            }   else if translation.x > 120 {
                println("fart")
                UIView.animateWithDuration((0.3), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.swipeView.center.x = 449
                    }, completion: nil)
                
                
            }
            
        }
    }
    
    
    
    @IBAction func didSwipe(sender: UIPanGestureRecognizer) {
        
        var location = sender.locationInView(view)
        var  translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            initialCenter = messageView.center.x
        }
        
        if sender.state == UIGestureRecognizerState.Ended {
            var ox = Float(messageView.center.x)
            if ox > 240 {
                UIView.animateWithDuration((0.2), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.awesomeView.center.x = 1000
                    }, completion: nil)
                
                
                func delay(delay:Double, closure:()->()) {
                    dispatch_after(
                        dispatch_time(
                            DISPATCH_TIME_NOW,
                            Int64(delay * Double(NSEC_PER_SEC))
                        ),
                        dispatch_get_main_queue(), closure)
                }
                
                delay(0.5) {
                    UIView.animateWithDuration((0.2), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                        self.feedView.center.y = 700
                        }, completion: nil)
                    
                }
                
            } else if ox < 130 && ox > -20 {
                
                UIView.animateWithDuration((0.2), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.awesomeView.center.x = -1000
                    }, completion: nil)
                
                func delay(delay:Double, closure:()->()) {
                    dispatch_after(
                        dispatch_time(
                            DISPATCH_TIME_NOW,
                            Int64(delay * Double(NSEC_PER_SEC))
                        ),
                        dispatch_get_main_queue(), closure)
                }
                
                delay(0.25) {
                    UIView.animateWithDuration((0.2), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                        
                        self.rescheduleGroup.alpha = 1
                        }, completion: nil)
                    
                    
                }
                
            } else if ox < -20  {
                UIView.animateWithDuration((0.2), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.awesomeView.center.x = -1000
                    }, completion: nil)
                
                func delay(delay:Double, closure:()->()) {
                    dispatch_after(
                        dispatch_time(
                            DISPATCH_TIME_NOW,
                            Int64(delay * Double(NSEC_PER_SEC))
                        ),
                        dispatch_get_main_queue(), closure)
                }
                
                delay(0.25) {
                    UIView.animateWithDuration((0.2), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                        
                        self.listGroupView.alpha = 1
                        }, completion: nil)
                    
                    
                }
                
            } else {
                UIView.animateWithDuration((0.2), delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    self.messageView.center.x = 180
                    }, completion: nil)
            }
            
            
        }
        
        
        if sender.state == UIGestureRecognizerState.Changed {
            var mx = Float(messageView.center.x)
            var ox = Float(translation.x)
            var rx = convertValue(ox, 0,60,0,1)
            var lx = convertValue(ox, 0,-60,0,1)
            
            messageView.center.x = (initialCenter + translation.x)
            
            if mx > 180 && mx < 240 {
                UIView.animateWithDuration((0.1), animations: {
                    self.rowBackground.backgroundColor = self.grayColor
                })
                checkIcon.transform = CGAffineTransformMakeScale(CGFloat(rx), CGFloat(rx));
                checkIcon.alpha = CGFloat(rx)
                println(deleteIcon.alpha)
                
            } else if mx < 380 && mx > 240 {
                var difference = CGFloat(ox - 10)
                self.rowBackground.backgroundColor = self.greenColor
                rightIcons.center.x = difference
                checkIcon.alpha = 1
                deleteIcon.alpha = 0
                
                
            } else if mx <  180 && mx > 130 {
                println("small")
                laterIcon.alpha = CGFloat(lx)
                laterIcon.transform = CGAffineTransformMakeScale(CGFloat(lx), CGFloat(lx));
                self.rowBackground.backgroundColor = self.grayColor
                
            } else if mx > 380 {
                var difference = CGFloat(ox - 10)
                self.rowBackground.backgroundColor = self.redColor
                rightIcons.center.x = difference
                checkIcon.alpha = 0
                deleteIcon.alpha = 1
                
                
            } else if mx < 130 && mx > -10 {
                var difference = CGFloat(ox + 365)
                iconGroup.center.x = difference
                laterIcon.alpha = 1
                listIcon.alpha = 0
                self.rowBackground.backgroundColor = self.yellowColor
                
            } else if mx < -10 {
                println("lessthan")
                var difference = CGFloat(ox + 365)
                iconGroup.center.x = difference
                laterIcon.alpha = 0
                listIcon.alpha = 1
                self.rowBackground.backgroundColor = self.brownColor
                
                
            }
            
            
            
            
        }
    }
    
    
    
}


