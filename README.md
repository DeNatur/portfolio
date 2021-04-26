# Portfolio

Portfolio website made in Flutter and hosted on Firebase Hosting

Website is available on this link: https://szymon-stasik.web.app/

## Table of contents
* [Introduction](#introduction)
* [Status](#status)
* [Technologies](#technologies)
* [Pros and Cons of using Flutter Web](#pros-and-cons-of-using-flutter-web)

## Introduction

This project is a simple single-page portfolio website made in Flutter to check the stability of the Flutter web
and showcase my current experience as Mobile Programmer.

The current progress of the website can be seen on this [kanban board](https://github.com/DeNatur/portfolio/projects/1)

## Status

The current status of the project is _in progress_.

## Technologies
Project is created with:
* Flutter version 2.0
* Riverpod and Flutter Hooks as the state management system
* Lottie for animations

The project has built-in pre-cache system loading assets before starting the app.

To correctly build and run website you need to add flag _--web-renderer canvaskit_
This is needed for Lottie to run smoothly on mobile and improves the scrolling experience

## Pros and Cons of using Flutter Web

Even though Flutter Web was moved to stable branch in the 2.0 version it is still not production-ready!

Pros:
* Easily transferable code from mobile project
* No need to use CSS or HTML to style project
  website can be build using just one language - dart,
* Ability to fast build PWA
* Easy transition from building mobile apps

Cons:
* Very young technology
* Especially on Firefox scrolling on the desktop has still low performance
* Images take long to load
* Website needs 3-10 seconds on first boot to load and cache assets
* Hot reload not available
