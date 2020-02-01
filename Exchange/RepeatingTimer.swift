//
//  RepeatingTimer.swift
//  Exchange
//
//  Created by Александр Алгашев on 10/09/2019.
//  Copyright © 2019 Александр Алгашев. All rights reserved.
//

import Foundation

/// RepeatingTimer mimics the API of DispatchSourceTimer but in a way that prevents
/// crashes that occur from calling resume multiple times on a timer that is
/// already resumed (noted by https://github.com/SiftScience/sift-ios/issues/52
class RepeatingTimer {
    
    let timeInterval: TimeInterval
    private var timer: DispatchSourceTimer?
    var eventHandler: (() -> Void)?
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
        self.configureTimer()
    }
    
    private func configureTimer() {
        let timer = DispatchSource.makeTimerSource()
        timer.schedule(deadline: .now() + self.timeInterval, repeating: self.timeInterval)
        timer.setEventHandler(handler: { [weak self] in
            self?.eventHandler?()
        })
        self.timer = timer
    }
    
    private enum State {
        case suspended
        case resumed
    }
    
    private var state: State = .suspended
    
    deinit {
        self.destroy()
        self.eventHandler = nil
    }
    
    private func destroy() {
        self.timer?.setEventHandler {}
        self.timer?.cancel()
        /*
         If the timer is suspended, calling cancel without resuming
         triggers a crash. This is documented here https://forums.developer.apple.com/thread/15902
         */
        self.resume()
    }
    
    func reset() {
        self.destroy()
        self.state = .suspended
        self.configureTimer()
    }
    
    func resume() {
        if self.state == .resumed { return }
        self.state = .resumed
        self.timer?.resume()
    }
    
    func suspend() {
        if self.state == .suspended { return }
        self.state = .suspended
        self.timer?.suspend()
    }
}
