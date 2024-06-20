# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require 'active_support/all'
require './candidates'
require './filters'

## Your test code can go here

pp @candidates
puts find(5, @candidates)
puts experienced?(@candidates[1])
puts qualified_candidates(@candidates)
puts ordered_by_qualifications(@candidates)