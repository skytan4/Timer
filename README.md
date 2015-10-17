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

## Guide - Day 1

Note: Try to avoid looking at the hints until you get stuck. Try to figure it out on your own.

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

### Black Diamonds

### Tests

## Contributions

Please refer to CONTRIBUTING.md.


## Copyright

© DevMountain LLC, 2015. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.