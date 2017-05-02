# techtest-euler-22
Tech test to complete Project Euler Q22 - sort, sum and product of a text file

## Challenge summary

The original is at https://projecteuler.net/problem=22


> Using names.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

> For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

> What is the total of all the name scores in the file?


## Installation, running and technologies

It is intended that the solution works with a recent-ish version of Ruby with no extra gems required. `ruby twentytwo.rb` should work as long as the default `names.txt` file is in the same directory.

Running tests requires that a test framework be installed, so you'll need to have Bundler installed, and run `bundle install` in the project root to install RSpec. Once that's done, running `rspec` should execute the tests.

## Development tasks

These may change as development progresses:

- [x] Set up Gemfile, RSpec framework, and README - I also created a Name class, just to test the structure was working
- [ ] Read the names file into an array
- [ ] Alphabetise the array
- [ ] Calculate a name_score for each name
- [ ] Handle non-alphabetic characters appropriately
- [ ] Work out a name_place_score for a name in an ordered list
- [ ] Calculate a list_score for a list of alphabetised names
- [ ] Refactoring - does diffing or similar help on iterative name_score for similar names?
- [ ] Refactoring - does memory usage need consideration for in-memory storage of intermediate states?
- [ ] (Add ability to give a new filename instead of names.txt)

## Structure

Our end goal is a file, `twentytwo.rb`, which when run should return the solution to Project Euler Q22. However, to make the code cleaner and more re-usable, it's preferable to encapsulate the code in classes and methods, which are stored in the `lib` folder in this instance. We have the original text file, which is read into a list. The list is made of names, and has a score which is dependent on the names and their position in the list.

The methods we're looking at include:

* name_score operating on a name
* name_place_score operating on name_score and position in name_list
* list_score operating on name_place_score and name_list

The classes we're looking at include:

* Name
* Name_List
