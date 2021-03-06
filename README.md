<<<<<<< HEAD
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

Made merch image frames scale to device size, created a basic Youtube page design layout and added a *URLImageModel* that loads images from URL.

**Changes to the code**

MerchView
- All *ForEach* functions now only take in an *Identifiable* since u can iterate over that
- added *GeometryReader* to main body that passes a *CGSize* to *MerchRowView* and *MerchItemView*. Image and button frame size is now (width/2, height/3) and (width/2 * 1.25, height/3 * 1.25) respectively
- an *OTVStreamer* is passed into *MerchRowView* instead of *StreamerMerch* as name variable was moved to a *Streamer*

ImageModifier
- Added parameter *numberOfIcons* so icon spacing matches number of icons on a tab bar

YoutubeView
- Draft concept of the youtube page will be a custom tab bar of latest videos, latest videos by streamer, and all videos of a selected streamer.
- YoutubeView will have a control flow switching between the three pages and a *YoutubeTabBar*
- Added a temporary title, *YoutubeTabBar* under, then a View according to which youtube tab.

YoutubeTabBar
- Tab bar that switches between the three different *YoutubeView* pages

URLImageModel
- this is an *ObservableObject* that helps load images from URLs and stores it inside this model.
- uses async main thread to load image

URLImageView
- displays the image from the *URLImageModel*, default image when it has not loaded.
- Takes in an URL string, width, and height of the image

YoutubeStreamerView
- created one of the pages of the youtube tab. Should show the top 10 latest youtube videos of all streamers
- holds a *OTVViewModel* and uses a *NavigationView* body

StreamerModel
- added a new struct *YoutubeVideo* that holds all the basic information of a Youtube video, including channel name.
- added an *Array<YoutubeVideo>* to *OTVStreamer*

OTVViewModel
- updated past *OTVStreamer* objects to properly initialize with the new data struct
- added an intent function getLatestVideos(numVid: Int) that takes in an Int and returns an *Array<YoutubeVideo>* of according count. The function temporary returns a hardcoded array but should filter and sort out a list of videos in the future. Not sure if the sorting process should happen in the model or view model.


###### **July 6th**

Fixed some tab bar layout bug as GeometryReader was causing views to fill whole container.

**Changes to code**

ImageModifiers
- changed *IconView* to take in a width and height instead of a *GeometryProxy* 
- changed toIcon function to take in a width and height instead of a *GeometryProxy*
- removed numberOfIcons
- I changed the *IconView* to take in an individual width and height instead of a *GeometryProxy* because the proxy was taking in the size of the a tab bar so it doesn't make sense if *IconView* isn't used on a tab bar. NumberOfIcons variable is also removed for that reason.

YoutubeTabBar
- removed *GeometryReader* and instead passed in a *GeometryProxy* from parent View so inner View does not become inflexible.
- Moved frame from parent view to this view
- Added a private function to create icon frames 
- Added a title to tab bar

CustomTabBarView
- removed *GeometryReader* and instead passed in a *GeometryProxy* from parent View so inner View does not become inflexible.
- Moved frame from parent view to this view

YoutubeHomeView
- added a bogus navigation title to hide navigation bar.

YoutubeView
- removed the title from the view and moved to Youtube tab bar

###### **July 7th**

Cleaned up some code, fixed the scaling for some text and added swift documentation.

**Changes to code**

CustomTabBarView
- added a helper function to help make the tab bar icons
- put the calculated value icon width/height into variables
- changed tappable images into buttons

YoutubeTabBar
- added ViewModfiers to title, made font bold, color white, added padding, and scaled font size to *GeometryProxy* with a scale factor.
- put the text modifiers into an extension
- changed tappable images into buttons.
- added a shadow below tab bar so the white bar below icon is more obvious

TextModifiers
- created a new extension to help with modifying fonts in the app

MerchView
- made the fonts scale to *GeometryProxy* and changed image width/height into variables

###### **July 8th**

Cleaned up the view for *YoutubeStreamerView*, abstracted the thumbnail+info view to be resuable in other youtube pages. Added in a custom font. 

**Changes to code**

YoutubeHomeView
- 

YoutubeStreamerView
- moved text `ViewModifier`s to an extension
- scaled `Text`s font size with parent view container size
- enforced a one line rule to youtube titles.

TextModifiers
- added a helper to extension to make a youtube title
- added a helper to extension to make a youtube description

Info.plist
- added the "Fonts provided by algorithmn" property for custom fonts
- added KenyanCoffee.ttf for youtube logo font


## Goals today
- [x] Use Saahil's YoutubeStreamerView for YoutubeHomeView
- [x] Change the home button
- [x] Make font size scale with device, currently text on IPad Pro is too small
- [x] Add a button overlay on Youtube tab bar icons so it covers whole tab
- [x] Try to abstract Youtube card view 
- [ ] Fix home layout its kinda wack and off
=======
# Front end for OfflineTV App
Things done: Custom Tab Bar

Things in progress: merch page, yt page

Things still left to do: twitch page, home page, twitter page pls (- patrick)
>>>>>>> 841500bdff3f3aa41d695ea174b371dde8125dc2
