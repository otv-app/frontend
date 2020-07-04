# OTVDraft
This project is a draft copy of the OfflineTV IOS app made by Saahil, Patrick, and Cheng. I will be documenting the frontend changes here to be implemented into the main project.

## Change log
###### **July 2nd:**

Completed custom tab bar using *@ObservedObject* instead of *@State*. Custom tab bar uses an *ObservableObject* ViewRouter to keep track of change in tabs. 

**Changes to the code:**

CustomTabBarView
- made a util file ImageModifiers and grouped all the *@ViewModifier* in here, added a modifier helper function to an extended *Image*
- changed states from ints to enums, external state control uses *@ObservedObject*/*@Published* instead of *@State*
- Instead of overlaying a button on icons, directly added a tap gesture to the image itself

MerchView
- added *Identifiable* protocol to *Merch* and *StreamerMerch*


###### **July 3rd:**

Set up a basic MVVM structure, separated the model logic in the MerchView into a separate files and made a View Model

**Changes to the code**

StreamerModel
- moved *Merch*, *StreamerMerch* struct to a new StreamerModel file, moved the name variable in *StreamerMerch* to a new *Streamer* protocol.
- added a *OTVSTreamer* of *Streamer* protocol.

OTVModel
- created a temporary model struct that stores an array of type T where T is a *Streamer*, currently the OTV streamers are of type *OTVStreamer* in case we want to implement other streamers in the future

OTVViewModel
- this view model has a *ObservableObject* protocol so it can track changes to the model as its passed in the view.
- should initialize the model here as *OTVModel<OTVStreamer>* and prob api calls 
- model is *@Published* so view can be redrawn when tab changes or model changes
- Intent functions should go here though it would probably be only getter methods for now
- holds a copy of the *Array<Streamer>* from the model.

OTVView
- Custom tab bar and control flow for different tabbed views go here.
- since *@ViewBuilder* can't have control flow for now, I have casted the views to *AnyView*
- holds *ObservedObject* ViewRouter and *ObservedObject* OTVViewModel so view can be updated
MerchView
- holds an *ObservedObject* OTVViewModel since streamer data has been moved to the model.


###### **July 4th**

In progress...

**Changes to the code**

MerchView
- All *ForEach* functions now only take in an *Identifiable* since u can iterate over that
- added *GeometryReader* to main body that passes a *CGSize* to *MerchRowView* and *MerchItemView*. Image and button frame size is now (width/2, height/3) and (width/2 * 1.25, height/3 * 1.25) respectively
- an *OTVStreamer* is passed into *MerchRowView* instead of *StreamerMerch* as name variable was moved to a *Streamer*

## Goals today
- [x] Add GeometryReader to MerchView
- [ ] URL to Images for Merch page
- [ ] Design the Youtube page
- [ ] Clean up code for custom tab bar
- [ ] Change the home button
