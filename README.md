# routine_checker

The Routine Checker Application enables users to add, edit and manipulate routines, ensuring proper 
notification on routine timing and providing a seamless routine integration approach.

## Getting Started

The Design Overview is available at:
- [Routine Checker Design Overview](https://www.figma.com/file/PljPJifDcEwQ8jnbvRPjql/Routine-Checker?node-id=0%3A1)

## Routine Checker Application

This application is built using the MVC Architecture
The file structure is as follows:

Core: This is the core application information, including enumerations, services etc.

Model: This holds information about various models for use within the application

Providers: The state management package provider and all derivatives used for 
    managing the state of the application should be contained here.

UI: This houses the View in a sub-structure along with the accompanying viewModel.
    The UI also contains a sub-structure for defining widgets used either globally or
    within a view.

utils: These include utility functionalities and definitions such as dimensions,
    text_styles or even small functions that run in linear time.



## State Functionality

To utilize a routine state functions, look through the [routine_provider.dart](lib/providers/routine_provider.dart)
file and browse through recommended functions.

For functionality requiring extending state from abstracted state management, 
that has not been written yet due to time constraints.

## Notice?

This application is incomplete and has bugs. The tests are also incomplete and the
design is engineering-based. Bear with me.

Have fun looking through the code.
if you're unsatisfied, text me at [My Email](mailto:thurggex@gmail.com) and I would be happy to
explain myself.
    