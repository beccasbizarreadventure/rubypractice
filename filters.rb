# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

#In Ruby, when accessing elements of a hash, you use the syntax hash[key]. 
#Since @candidates is an array of hashes, you should use elem[:id] instead of elem.id inside the block passed to find. 
#This is because elem is each hash element of the @candidates array, and :id is the key you're comparing against id.
def find(id, array)
  array.select{|elem| elem[:id] == id}
  end
  
  #In Ruby, methods that end with a ? typically return a boolean value (true or false). 
  #It's a convention used to indicate that the method is a predicate method 
  #meaning it tests a condition and returns true or false based on that condition.
  def experienced?(candidate)
    candidate[:years_of_experience] > 2
  end
  
  def qualified_candidates(candidates)
    good_candidates = candidates.select do |candidate| 
      candidate[:years_of_experience] > 2 && 
      candidate[:github_points] >= 100 &&
      candidate[:languages].any? {|language| ['Python', 'Ruby'].include?(language)} &&
      candidate[:date_applied] > 15.days.ago.to_date &&
      candidate[:age] > 17 
    end
    good_candidates.inspect
  end
  
  def ordered_by_qualifications(candidates)
    candidates.sort_by {|candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  end