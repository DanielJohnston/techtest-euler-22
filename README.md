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
- [x] Calculate a name_score for each name
- [x] Alphabetise a list of names
- [ ] Work out a name_place_score for a name in an ordered list
- [ ] Calculate a list_score for a list of alphabetised names
- [ ] Read the names file into a list
- [ ] Refactoring - does diffing or similar help on iterative name_score for similar names?
- [ ] Refactoring - does memory usage need consideration for in-memory storage of intermediate states?
- [ ] (Handle non-alphabetic characters appropriately) - the given text file is all upper case alphabetic
- [ ] (Add ability to give a new filename instead of names.txt) - goes beyond the brief

## Structure and approach

Our end goal is a file, `twentytwo.rb`, which when run should return the solution to Project Euler Q22. However, to make the code cleaner and more re-usable, it's preferable to encapsulate the code in classes and methods, which are stored in the `lib` folder in this instance. We have the original text file, which is read into a list. The list is made of names, and has a score which is dependent on the names and their position in the list.

The methods we're looking at include:

* name_score operating on a name
* name_place_score operating on name_score and position in name_list
* list_score operating on name_place_score and name_list

The classes we're looking at include:

* Name
* NameList

### Public and private methods

A number of methods have been left open that aren't explicitly required by the spec. To test that objects match to requirements, there are methods that return instances out of the class, e.g. `name` and `list`. It would be possible to create RSpec matchers that force access to the internals, or to test purely on end results, but this approach was preferable for TDD purposes.

### Efficiency

Each class and instance in Ruby brings an overhead in processing and memory usage. I'm using a formal separation for this, partly so that I can take a TDD approach to solving the problem. It would potentially be more efficient to solve the problem in a single script with minimal object creation. The best approach to take would likely depend on longer term goals. As is, I've held off from defining a Letter class, as it would make some of the code very slightly more readable, but would add a bit too much complexity to my mind.

A specific efficiency issue related to structure is that a simple #sort or #sort_by on an array of strings is likely to be more efficient than the separated approach of defining comparison within each name instance. That is, sorting names alphabetically within a list is trivial when each element in the list is a string, but when it's a Name object then <=> has to be defined as a custom method in the class.
