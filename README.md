# work-walk-timer

This is a SwiftUI app that helps user to manage work/walk cycle.

## features

- User can set work time duration by minutes (default setting is 20 min)
- When user set app to "working" state, app count down pre-set work time, and notify user by Shishiodoshi sound when time is up
- When user set app to "walking" state, app plays music for your walk (stretch or whatever) until user starts working

## app usage guide

- From "Timer" icon, user can set work time duration by minutes on "Time Setting" screen. Tap "Update" to reflect the input.
- From "Walking" screen, tapping "Start Working" will bring user to "Working" screen, which count down remaining minutes of pre-set work time.
  - Stop button will show "Start Walking" button even when time hasn't come yet
- When time is up, "Working" screen will show "Start Walking" button. At the same time, Shishiodoshi sound is played repeatedly every 10 sec until "Start Walking" button is tapped.
- From "Working" screen, tapping "Start Walking" will bring user to "Walking" screen, which plays music until "Start Working" is tapped.
  - Stop button can only stop music.
  
<img width="907" alt="Screenshot" src="https://user-images.githubusercontent.com/52210484/78781158-5a1a7d80-79d2-11ea-98a2-2ff6684a045f.png">

## images and sounds from

- Images: https://www.irasutoya.com/
- Shishiodoshi sound: https://pocket-se.info/
- Walking music sound: https://amachamusic.chagasi.com/
