# You Can English

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5. [Milestone 2](#Milestone-2)

## Overview
### Description

"You Can English" is a game that tests your knowledge of English vocabulary. Prepare for the SHSAT/SAT/ACT/GRE exams using this app, or impress your friends and family with convoluted vocabulary in your daily lives, the possibilities are endless!

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Educational game
- **Mobile:** Provides a portable studying experience without a constant need for the internet
- **Story:** Allows users to test and gain new vocabulary for daily/exam use
- **Market:** Rising high school, undergraduate, and graduate students
- **Habit:** Users can expand their vocabulary through games that they have access to anywhere they go, anytime they want
- **Scope:** Single player, testing english knowledge - can expand to multiplayer and flashcard feature

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can test their english synonym knowledge with a multiple choice test
* User can compare their current quiz score and their high score
* User can view a list of their correct and incorrect answers, and their respective synonyms

**Optional Nice-to-have Stories**

* Users can keep view their progress and show off their growth to their friends and family via a progress bar or dashboard
    * login page + database
* User can test their english definition knowledge with a multiply choice test
* User can test their english antonym knowledge with a multiple choice test
* User can test their english synonym/antonym knowledge by typing in their answer
* User can use this app as a dictionary
    * search bar for user to search for words
    * advance search, i.e. look for only synonyms, definition, and/or antonym, etc

### 2. Screen Archetypes

* Home/Start Screen
   * Start screen to bring user to mode screen 
* Mode Screen
   * Allows user to choose what mode they want to play (synonym, flash cards, definition, etc)
       * Synonym is a must; all additional modes are optional
* Game Screen
   * Allows user to choose between 4 choices to guess the synonym of the word given
   * Button flashes green/red based on if user gets it right/wrong - if wrong, right answer flashes green as well
* Score/Result Screen
   * Shows to user their current score along with their high score across all games that they have played
   * Displays the list of words that the user saw during their round of game play
       * The words that they answered correctly are colored in green, while the words that they answered incorrectly are colored in red
   
### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Mode Screen
* High Score Dashboard (** maybe)
* Saved Words (** maybe)

**Flow Navigation** (Screen to Screen)

* Start Screen -> Mode Screen 
* Mode Screen -> Game Screen or Start Screen
* Game Screen -> Score/Result Screen
* Score/Result Screen -> Mode Screen

## Wireframes
<img src="https://github.com/EngWish/you-can-english/blob/main/wireframe/owo_draft1.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
### Models

#### Game question
| Property      | Type     | Description |
| ------------- | -------- | ------------|
| word          | String   | currently displayed word  |
| mcOptions     | String[] | list of 1 correct synonym and 3 false synonyms|
| time          | Number   | amount of time the user has to answer the questions|
| currentScore  | Number   | current score user has achieved    |
| highScore     | Number   | highest score user has achieved    |

#### Game result

| Property      | Type     | Description |
| ------------- | -------- | ------------|
| words         | String[] | words that were given during the game|
| answerKey     | String[] | correct answers for each question |
| correctAnswers | Number[] | question numbers that the user answered correctly |
| incorrectAnswers | Number[] | question numbers that the user answered incorrectly |
| currentScore  | Number   | current score user has achieved    |
| highScore     | Number   | highest score user has achieved    |

### Networking

* Home/Start Screen 
    * Nothing
* Mode Screen
    * Nothing
* Game Screen
    * (Read/GET) word - get random word + synonyms from API
    ```swift
             let query = PFQuery(className:"Word")
             query.findObjectsInBackground { (word: [PFObject]?, error: Error?) in
                if let error = error { 
                   print(error.localizedDescription)
                } else if let word = word {
                   print("Successfully retrieved word.")
               // TODO: Do something with word and its synonyms...
                }
             }
    ```
    * (Read/GET) incorrect mcOptions - get random word that is not in word synonym list
    ```swift
         let query = PFQuery(className:"IncorrectAnswers")
         query.findObjectsInBackground { (incorrectAnswers: [PFObject]?, error: Error?) in
            if let error = error { 
               print(error.localizedDescription)
            } else if let incorrectAnswers = incorrectAnswers {
               print("Successfully retrieved \(incorrectAnswers.count) incorrect answers.")
           // TODO: Do something with incorrect answers...
            }
         }
    ```
* Score/Result Screen
    * Nothing

## Milestone 2

### User Stories

#### REQUIRED
- [x] User can view stylized loading screen with logo (when first starting up the app)
- [x] User can view start screen and tap button to enter mode screen
- [x] User can view different mode options and select a mode to play
- [x] User can view game screen and choose to end the session
- [x] User can view session status after ending game and choose to return to mode screen

### App Walkthrough GIF
<img src= width=250><br>

GIF created with QuickTime Player and [ezgif.com](https://ezgif.com/video-to-gif)
