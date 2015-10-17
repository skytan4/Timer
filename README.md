# Timer

Students will build a timer/alarm app, similar to Apple's Clock app, using NSTimer, StackViews, UIAppearance, UITabBarController, UIPickerViews, UIButtons.

Students who complete this project independently are able to:

* Work with UITabBarControllers
* Work with UIStackViews (and very basic autolayout)
* Use NSTimer to schedule function calls
* Build a reuseable Timer class
* Use protocols to set up UIPickerViews
* Use UIPickerViews to get user input
* Use button to respond to user interaction
* Use NSNotifcations to respond to events
* Use UILocalNotifications to alert user of events
* Use UIAlertControllers to display alerts to user
* Use UIProgressViews to display progress
* Use CALayers to modify views' look

## Guide - Day 1

Note: Try to avoid looking at the hints until you get stuck or have attempted it on your own. Use the hints to check your progress.

### UI - Timer View

Build a view that allows the user to input a desired length of time and allows the user to start a timer. The timer should count down to zero. When the timer reaches zero, reset the views to allow the user to input and start another timer. Use UIStackViews to help with the layout. See the screenshots, app wireframe diagram, and run solution code to see the recommended layout.

1. Embed the TimerViewController in a UINavigationController. Embed the UINavigationController in a UITabBarController.
2. Using the screenshots, app wireframe diagram, and running the solution code to see the recommended layout, layout the views for the timer view. No need to add design and color at this point.
	* HINT: Constraints you will need:
		* PickerViews should have equal width
		* TimerLabel leading, training, bottom to super view leading, trailing bottom
		* TimerLabel top to super view top + 2
		* PickerView leading, top, trailing, bottom to super view leading margin, top, trailing margin, bottom
		* PauseButton aspect ratio 1:1
		* StartButton aspect ratio 1:1
		* StartButton width = 100
		* StartButton, PauseButton equal width
		* ButtonStackView center x, top, bottom to super view center x, top, bottom
		* MainStackView leading, top, trailing, bottom to super view leading, top layout guide, trailing, bottom layout guide

3. Hook up the necessary views in storyboard to the TimerViewController file.
	* HINT: You should have 7 view related properties
	* HINT: The views you have are:
		* timerLabel
		* hourPickerView
		* minutePickerView
		* pauseButton
		* startButton
		* pickerStackView
		* progressView
4. Implement the delegate and datasource for the two UIPickerViews. One should display the hours 0-23 and the other the minutes 0-59.
	* HINT: Don't forget to link up the delegate and datasource of the picker views
5. Add actions to the buttons with empty implementation.

### UI - Alarm View

1. Add an another ViewController to storyboard and a file for AlarmViewController. Make sure the ViewController custom class is set to the AlarmViewController.
2. Add a label to the AlarmViewController that says "Alarm View Controller". This is just a placehold until the AlarmViewController is implemented tomorrow.
3. Embed AlarmViewController in a UINavigationController. Add the UINavigationController as a viewController on the UITabBarController.

### Implement Timer Class

1. Create a new cocoa touch class called Timer which subclasses NSObject.
2. Create static constant Strings for the TimerSecondTickNotification and TimerCompleteNotification.
3. Create properties for a timer.
	* HINT: 
		* ```private(set) var seconds = NSTimeInterval(0)```
		* ```private var timer: NSTimer?```
		* ```var isOn: Bool``` (computed property, check whether the timer is nil or not, timer will only be nil when not running)
4. Create a func setTime(second: NSTimeInterval).
5. Create a func startTimer().
	* HINT: If the timer property is nil, this will create a scheduled NSTimer and assign it to the timer property. The NSTimer should call the secondTick selector.
6. Create a func stopTimer()
	* HINT: If the timer property is set, this will invalidate the timer and set the timer property equal to nil
7. Create a func secondTick()
	* HINT: If the timer property is set, this function should decrease the seconds remaining on the timer by 1 and post a secondTickNotification. If the seconds have reached 0, it should also post a timerCompleteNotification and call stopTimer().
8. Create a func timerString() -> String
	* HINT: This method should take the number of seconds remaining and create a string that the user would expect to see on a timer.

### Link up the timer UI with the Timer class

1. Implement the startTimerButtonTapped function.
	* HINT: this method should check whether the user is starting the timer or canceling the timer and the views should update appropriately (button titles, hiding/unhiding pickerStackView, timerLabel, progress view)
2. Observe the second tick notification. When the viewcontroller observes this notification, it should update it's views; create a function that will update the required view after each second.
	* HINT: You may need a variable to hold to total number of seconds that user set the timer to so you can update the progress view.
3. Observe the timerCompleteNotification. The function this notification should call should reset the views to allow the user to start another timer.

### Black Diamonds

### Tests

## Contributions

Please refer to CONTRIBUTING.md.


## Copyright

© DevMountain LLC, 2015. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.