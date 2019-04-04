Group Project
===

# Bathroom Break

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Yelp for public restrooms in NYC

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Utility
- **Mobile:** iOS
- **Story:** Developed to facilitate everyday life.
- **Market:** Everyone in NYC
- **Habit:** N/A
- **Scope:** Anywhere supported by our map API.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can create an account
* Users can login and logout
* Users can stay logged in
* Users can set their current location
* Users will be shown closest public restrooms based on their current location
* Users have a profile that shows their previous ratings
* Users add new locations and can rate existing entries based on their experience at the restroom out of 5 stars, disability accessibility, purchase needed to use?, toilet paper ply, hand dryers, etc.
* Ability to add and delete reviews



**Optional Nice-to-have Stories**

* TBD


### 2. Screen Archetypes

* Login
   * Users can log in
   * Users can create an account
* Map View
   * Users can set their current location
   * Users will be shown closest public restrooms based on their current location
* New Bathroom
    * Users can add a new bathroom location into the database
* New Bathroom Rating
    * Users can submit a rating for the bathroom and add photos to it
* Bathroom List View
    * Users can see a list of results based on the search location
* Bathroom Details
    * Users can view additional details, ratings and photos of the bathroom
* Settings
    * User defaults
* Profile
    * Users can see a list of their past ratings

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Profile
* Map
* Settings

**Flow Navigation** (Screen to Screen)

* Login
   * Map View
* Mapview
   * Bathroom List View
   * Bathroom Details
   * New Bathroom
* New Bathroom
    * Bathroom Details
    * Map View
* New Bathroom Rating
    * Bathroom Details
* Bathroom List View
    * Bathroom Details
    * Map View
* Bathroom Details
    * Map View
    * Bathroom List View
    * New Bathroom Rating
* Settings
* Profile
    * Login

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="https://i.imgur.com/vVtNbTl.jpg" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
