Given /^the following games:$/ do |games|
  Game.create!(games.hashes)
  puts Game.all.inspect
end

When /^I delete the "([^"]*.)" game$/ do |game_name|
    puts game_name.inspect
    game =  Game.find_by_name(game_name)
    puts game.inspect
    game.should_not be_nil
    path = edit_game_path(game)
    puts path.inspect
    visit path
    page.click_link "Destroy"
end

Then /^the "([^"]*.)" game should display "([^"]*.)"$/ do |game_name, expected_text|
    game =  Game.find_by_name(game_name)
    game.should_not be_nil
    path = game_path(game)
    get path      # this seems to need to be a get to go thru rack ?
    page.should have_content(expected_text)
end

Then /^I should see the following games:$/ do |expected_games_table|
  expected_games_table.diff!(tableish('table tr', 'td,th'))
end

Then %r{^I should see "([^"]*)" inside ([^"].*)$} do |expected_text, named_element|
  sleep 5
  within_frame named_element do
    page.should have_content(expected_text)
  end
end

