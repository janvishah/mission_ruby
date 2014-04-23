# Ruby

### What exactly happens when you install ruby?

* when we install ruby first it store in /usr/bin/env.
* now i make one ruby file in ~/temp and i try to run this file so it can not run. Because the execution file of ruby is not store in this folder.
* Excecution file of ruby is store in /usr/bin/env.
* For run ruby file from any folder we should give path of that file in .profile or .bashrc file. it's called set environment variable.
..* .profile
... this file is executed autometically during the startup process desktop session.
..* .bashrc
... this file is executed autometically every time when terminal open.
* After set a path we can excute ruby file from any folder.

### Where does it get installed?

* if we installed it by using rvm it is installed at  ~/.rvm/bin/ruby
* Without using RVM it is installed at ~/usr/bin/env

### What files are installed?
The execution files are installed 

erb  gem  irb  rake  rdoc  ri  ruby  testrb

### How do we get access to Ruby from any location in command prompt?

To get access to ruby from any location in command prompt we should write a path of that file in .bash_aliaases file.

The .bashrc file also include .bash_aliases file. this file store the execution file path. it makes easy to read .bashrc file.

ex: i make 1 file named hello.rb
    now i want that this file can be run from anywhere in the computer.
    for that i set path variable in .bash_aliaases file (add below line in this file.)
      alias exefilename = "path/to/file/exefilename"
      ex: alias hello.rb="~/Documents/hello.rb"