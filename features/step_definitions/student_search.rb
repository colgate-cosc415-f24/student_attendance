# cucumber steps to support student_search.feature
#
Given('I am on the students page') do
    visit students_path
end

When('I fill in {string} with {string}') do |string, string2|
  fill_in string, with: string2
end

When('I press {string}') do |string|
  click_on string
end

Then('I should be on the students page') do
  expect(page.current_path).to eq(students_path)
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

Given('these Students:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |h|
    first,last = h['name'].split(/ /)
    h['first'] = first
    h['last'] = last
    h.delete('name')
    Student.create!(h)
  end 
end

Then('I should not see {string}') do |string|
  expect(page).not_to have_content(string)
end

