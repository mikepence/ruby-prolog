require 'rubygems'
require 'ruby-prolog'

# require File.join(File.dirname(__FILE__), %w[.. lib ruby-prolog])

# Inspired by..
# http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/2_3.html
# http://eigenclass.org/hiki.rb?tiny+prolog+in+ruby

c = RubyProlog::Core.new
c.instance_eval do

  move[0,:X,:Y,:Z] <<= :CUT   # There are no more moves left
  move[:N,:A,:B,:C] <<= [
    is(:M,:N){|n| n - 1}, # reads as "M IS N - 1"
    move[:M,:A,:C,:B],
    write_info[:A,:B],
    move[:M,:C,:B,:A]
  ]
  write_info[:X,:Y] <<= [
    write["move a disc from the "],
    write[:X], write[" pole to the "],
    write[:Y], writenl[" pole "]
  ]
   
   hanoi[:N] <<=  move[:N,"left","right","center"]

   puts "\nWhat's the solution for a single disc?"
   query(hanoi[1])

   puts "\n\nWhat's the solution for 5 discs?"
   query(hanoi[5])
   
   # do_stuff[:STUFF].calls{|env| print env[:STUFF]; true}
    
end