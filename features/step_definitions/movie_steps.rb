# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    #if !Movie.find(movie)
    Movie.create!(movie)
    #end
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.

  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

Given /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(/[^a-zA-Z0-9-]/).find_all{|x| x.length!=0}.each do |rating|
    #puts rating
    if uncheck 
      uncheck "ratings_#{rating}" 
    else
      #if page.all('#ratings_form input).id=="ratings_#{rating}
        check "ratings_#{rating}"
    end
  end
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

Then /^I should see movies only with "(.*?)" and "(.*?)" ratings$/ do |arg1, arg2|
  page.all('#movies tbody tr td[2]').map {|x| x.text}.uniq.sort.should == [arg1,arg2].sort
end

Then /I should see all of the movies/ do
  page.all('#movies tbody tr').size.should==Movie.count
end

