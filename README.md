# Pre-work - *Tip it!*

**Tip it!** is a tip calculator application for iOS.

Submitted by: **Vlad Kryhin**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [*] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [*] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [*] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://imgur.com/a/aZid4' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** [Xcoode is full fledged IDE, dedicated for iOS applications development.
UI interface is represented as storyboards that are 
essentially combination of user data stored in xml format and
being pulled from that file by plugin that rendering UI representation
with Cocoa Touch API which job is exactly for that. 
Every storyboard is identified with it's base class that is written in .swift files.
In Xcode developer, in order to use elements has to accociate them either with outlets (which are sort of references of that object) or with actions(which are in essence class methods for that object).
That way required logic can be implemented to deal with these elements and data displayed based on actions on UI.]


Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** [Since swift requires to use self. in clousures, it is possible to create strong 
references between closures and it's instances by capturing itself.
Both options to resolve strong reference cycles that applicable for classess  
can be also used to do it for closures. But there is one additional element required 
in closures to be set for that: Capture list. That way weak or unowned member can be paired with a reference
to a class instance within the closure.].


## License

Copyright [2017] [Vlad Kryhin]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
