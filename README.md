# FlexibleSteppedProgressBar

[![CI Status](https://travis-ci.org/amratab/FlexibleSteppedProgressBar.svg?branch=master)](https://travis-ci.org/amratab/FlexibleSteppedProgressBar)
[![Swift][swift-badge]][swift-url]
[![Version](https://img.shields.io/cocoapods/v/FlexibleSteppedProgressBar.svg?style=flat)](http://cocoapods.org/pods/FlexibleSteppedProgressBar)
[![License](https://img.shields.io/cocoapods/l/FlexibleSteppedProgressBar.svg?style=flat)](http://cocoapods.org/pods/FlexibleSteppedProgressBar)
[![Platform](https://img.shields.io/cocoapods/p/FlexibleSteppedProgressBar.svg?style=flat)](http://cocoapods.org/pods/FlexibleSteppedProgressBar)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![swift-package-manager](https://img.shields.io/badge/package%20manager-compatible-brightgreen.svg?logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNjJweCIgaGVpZ2h0PSI0OXB4IiB2aWV3Qm94PSIwIDAgNjIgNDkiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8IS0tIEdlbmVyYXRvcjogU2tldGNoIDYzLjEgKDkyNDUyKSAtIGh0dHBzOi8vc2tldGNoLmNvbSAtLT4KICAgIDx0aXRsZT5Hcm91cDwvdGl0bGU+CiAgICA8ZGVzYz5DcmVhdGVkIHdpdGggU2tldGNoLjwvZGVzYz4KICAgIDxnIGlkPSJQYWdlLTEiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnIGlkPSJHcm91cCIgZmlsbC1ydWxlPSJub256ZXJvIj4KICAgICAgICAgICAgPHBvbHlnb24gaWQ9IlBhdGgiIGZpbGw9IiNEQkI1NTEiIHBvaW50cz0iNTEuMzEwMzQ0OCAwIDEwLjY4OTY1NTIgMCAwIDEzLjUxNzI0MTQgMCA0OSA2MiA0OSA2MiAxMy41MTcyNDE0Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJQYXRoIiBmaWxsPSIjRjdFM0FGIiBwb2ludHM9IjI3IDI1IDMxIDI1IDM1IDI1IDM3IDI1IDM3IDE0IDI1IDE0IDI1IDI1Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJQYXRoIiBmaWxsPSIjRUZDNzVFIiBwb2ludHM9IjEwLjY4OTY1NTIgMCAwIDE0IDYyIDE0IDUxLjMxMDM0NDggMCI+PC9wb2x5Z29uPgogICAgICAgICAgICA8cG9seWdvbiBpZD0iUmVjdGFuZ2xlIiBmaWxsPSIjRjdFM0FGIiBwb2ludHM9IjI3IDAgMzUgMCAzNyAxNCAyNSAxNCI+PC9wb2x5Z29uPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+)](https://github.com/apple/swift-package-manager)

[swift-badge]: https://img.shields.io/badge/Swift-4.0-orange.svg
[swift-url]: https://swift.org
This is a stepped progress bar for IOS. The base code is derived from [ABSteppedProgressBar](https://github.com/antoninbiret/ABSteppedProgressBar). Most of the design is customisable. Text can be positioned inside the circles or on top or bottom of them or if the user wants, at all the three places. Please refer to usage section for more details.

![alt tag](https://github.com/amratab/FlexibleSteppedProgressBar/blob/master/FlexibleGreenThemeDemo.gif)
![alt tag](https://github.com/amratab/FlexibleSteppedProgressBar/blob/master/FlexibleYelloThemeBarDemo.gif)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FlexibleSteppedProgressBar is available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your cartfile:

```ruby
github jvigneshcs/FlexibleSteppedProgressBar
```

FlexibleSteppedProgressBar is also available through [Swift Package Manager](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

## Basic Usage

    import FlexibleSteppedProgressBar

    class ViewController: UIViewController, FlexibleSteppedProgressBarDelegate {

        var progressBar: FlexibleSteppedProgressBar!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            progressBar = FlexibleSteppedProgressBar()
            progressBar.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(progressBar)

            let horizontalConstraint = progressBar.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor)
            let verticalConstraint = progressBar.topAnchor.constraintEqualToAnchor(
                view.topAnchor,
                constant: 80
            )
            let widthConstraint = progressBar.widthAnchor.constraintEqualToAnchor(nil, constant: 500)
            let heightConstraint = progressBar.heightAnchor.constraintEqualToAnchor(nil, constant: 150)
            NSLayoutConstraint.activateConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

            // Customise the progress bar here
            progressBar.numberOfPoints = 5
            progressBar.lineHeight = 9
            progressBar.radius = 15
            progressBar.progressRadius = 25
            progressBar.progressLineHeight = 3
            progressBar.delegate = self
        }
        
        func progressBar(progressBar: FlexibleSteppedProgressBar,
                     didSelectItemAtIndex index: Int) {
            print("Index selected!")
        }
        
        func progressBar(progressBar: FlexibleSteppedProgressBar,
                     willSelectItemAtIndex index: Int) {
            print("Index selected!")
        }

        func progressBar(progressBar: FlexibleSteppedProgressBar,
                         canSelectItemAtIndex index: Int) -> Bool {
            return true
        }
    
        func progressBar(progressBar: FlexibleSteppedProgressBar,
                         textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
            if position == FlexibleSteppedProgressBarTextLocation.BOTTOM {
                switch index {
                    
                case 0: return "First"
                case 1: return "Second"
                case 2: return "Third"
                case 3: return "Fourth"
                case 4: return "Fifth"
                default: return "Date"
                    
                }
            }
        return ""
        }
    }
    
## Customisations

I made some modifications upon ABSteppedProgressBar because I had an extra state to cater to, Last State. It specifies the last indice user has covered on the progress bar. For example, my use case was to specify properties of a product in a particular oder through progress bar lets say there were Step 1, Step 2 to Step 5. So, if the user has completed till step 3, and he goes back to step 1 to make some modification, progres bar should indicate separately the step 3 as last state and step 1 as selected state. It is completely optional here. If you want to use last state, you can simply state your wish through useLastState parameter and specify completedTillIndex as the last state. Progress bar does not keep track of the last state. 

    There are four states for a progress point:
    1. Unselected and unvisited
    2. Unselected and visited
    3. Currently selected: These will have two concentric circles whose colors can be specified through 
        a) currentSelectedCenterColor: for inner circle fill color
        b) selectedOuterCircleStrokeColor: outer circle stroke color
        c) selectedOuterCircleLineWidth: outer circle line width
    4. Last state: Use of this state is up on the discretion of the implementation. It is by default false and can be changed through useLastState. If present, it will also have two concentric circles whose colors can be modified through:
        a) lastStateCenterColor: for inner circle fill color
        b) lastStateOuterCircleStrokeColor: for outer circle stroke color
        c) lastStateOuterCircleLineWidth: for outer circle line width

    Some general customisation options: 
    a) radius: Radius of circles for unvisited indices.
    b) progressRadius: Radius of circles for visited indices.
    c) lineHeight: Line height of the outer line for complete progress bar.
    d) progressLineHeight: Line height for the inner line with the selected background color that is shown only for the visited indices.
    e) numberOfPoints: It is the number of indices on the progress bar.
    f) stepAnimationDuration: Duration of animation
    g) backgroundShapeColor: This is the color for unselected and unvisited indices.
    h) selectedBackgoundColor: This is the color for unselected but visited indices.
    i) currentIndex: It is the current selected index. Value: 0 to (number of points - 1)
    j) completedTillIndex: It is the last state index. Value: 0 to (number of points - 1)

    CAUTION: If your background view is of any other color than white, please specify it in viewBackgroundColor. Otherwise you will keep seeing white color in between.

    Second reason for this library was text location. I needed flexible position for text. So, here I am providing three locations. 
    a) TOP
    b) CENTER
    c) BOTTOM

    You can specify the text you want to show through delegate method textAtIndex. For customising how text is displayed, specify the following values:
    a) currentSelectedTextColor: This is the text color for the current selected index for top and bottom positions.
    b) centerLayerTextColor: This is the text color for the the indices when it is neither selected nor last state only for center position.
    c) centerLayerDarkBackgroundTextColor: This is the text color for center position when it is either selected or last state.
    d) stepTextColor: This is the text color in the top or bottom positions for all but selected indices.
    e) stepTextFont: This is the font for all the positions and indices.
    f) textDistance: This is the distance of top and bottom text from the center of their respective indices. 
    
    Also, other customisation options are available through delegate methods.
    
## Author

Amrata Baghel, amrata.baghel@gmail.com

## License

FlexibleSteppedProgressBar is available under the MIT license. See the LICENSE file for more info.
