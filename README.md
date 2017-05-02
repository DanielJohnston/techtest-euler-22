# techtest-euler-22
Tech test to complete Project Euler Q22 - sort, sum and product of a text file

## Challenge summary

The original is at https://projecteuler.net/problem=22


> Using names.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

> For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

> What is the total of all the name scores in the file?


## Installation, running and technologies

It is intended that the solution works with a recent-ish version of Ruby with no extra gems required. `ruby twentytwo.rb` should work as long as the default `names.txt` file is in the same directory and the required class and module ruby files are in the `lib` subdirectory.

Running tests requires that a test framework be installed, so you'll need to have Bundler installed, and run `bundle install` in the project root to install RSpec. Once that's done, running `rspec` should execute the tests.

## Development tasks

These may change as development progresses:

- [x] Set up Gemfile, RSpec framework, and README - I also created a Name class, just to test the structure was working
- [x] Calculate a name_score for each name
- [x] Alphabetise a list of names
- [x] Work out a name_place_score for a name in an ordered list
- [x] Calculate a list_score for a list of alphabetised names
- [x] Read a names file into a list
- [x] Application code that opens names.txt and returns list_score
- [ ] Refactoring - does diffing or similar help on iterative name_score for similar names?
- [ ] Refactoring - does memory usage need consideration for in-memory storage of intermediate states?
- [ ] (Handle non-alphabetic characters appropriately) - the given text file is all upper case alphabetic
- [ ] (Add ability to give a new filename instead of names.txt) - goes beyond the brief

## Structure and approach

Our end goal is a file, `twentytwo.rb`, which when run should return the solution to Project Euler Q22. However, to make the code cleaner and more re-usable, it's preferable to encapsulate the code in classes and methods, which are stored in the `lib` folder in this instance. We have the original text file, which is read into a list. The list is made of names, and has a score which is dependent on the names and their position in the list.

The approach taken is TDD outside-in, with RSpec feature tests driving unit tests driving development. Feature tests were introduced once a second class was created, and unit tests use doubles and stubbing to maintain isolation. The feature tests are written in standard RSpec without Capybara, as there's no web component to development. The repo was committed to Git after completion of each feature, and branches aren't used as there's no parallel development or need to maintain a working master.

The solution methods we're looking at are:

* name_score operating on a name
* name_place_score operating on name_score and position in name_list
* list_score operating on name_place_score and name_list

A number of methods have been left public that aren't explicitly required by the spec. To test that objects match to requirements, there are methods that return instances out of the class. It would be possible to create RSpec matchers that force access to the internals, or to test purely on end results, but this approach seemed preferable for now. Those methods are:

* name
* names
* position

Additionally, the <=> method is defined on Name so that the sort method can be used on an array of names

The classes we're looking at are:

* Name
* NameList

In order to TDD the file reading, I created an Ingest module which returns a NameList full of Name objects. This feels dubious, but seemed preferable to not testing. I ended up stubbing CSV.read as CSV doesn't use the expected IO stream, and there wasn't really enough left over to justify writing unit tests.

### Efficiency and memory usage

Each class and instance in Ruby brings an overhead in processing and memory usage. I'm using a formal separation for this, partly so that I can take a TDD approach to solving the problem. It would potentially be more efficient to solve the problem in a single script with minimal object creation. The best approach to take would likely depend on longer term goals. As is, I've held off from defining a Letter class, as it would make some of the code very slightly more readable, but would add a bit too much complexity to my mind.

A specific efficiency issue related to structure is that a simple #sort or #sort_by on an array of strings is likely to be more efficient than the separated approach of defining comparison within each name instance. That is, sorting names alphabetically within a list is trivial when each element in the list is a string, but when it's a Name object then <=> has to be defined as a custom method in the class.

It's worth noting that none of the RSpec examples go anywhere near the final text file in terms of complexity and size.
