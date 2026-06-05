# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

QuestionOption.destroy_all
Response.destroy_all
JournalEntry.destroy_all

#  Above commands NUKE DB

Question.destroy_all

Question.create!([
    {content: "How did you sleep?", response_type: "integer", position: 1},
    {content: "Did you train in the last 24 Hours?", response_type: "boolean", position: 2}, # Need to look at this and Q3 as Parent child logic in future
    {content: "How intensley did you train?", response_type: "integer", position: 3}, # Need to look at this and Q2 as Parent child logic in future
    {content: "Did you hit your protine goal yesterday?", response_type: "boolean", position: 4}, 
    {content: "How much screen time did I have yesterday?", response_type: "time", position: 5}, # I would like to try API this data in the future
    {content: "Did anything happen yesterday to make me feel worse?", response_type: "boolean", position: 6}, # Need to look at this and Q7 as Parent child logic in future
    {content: "What happened to make you feel bad?", response_type: "string", position: 7},# Need to look at this and Q6 as Parent child logic in future
    {content: "When did you last see friends?", response_type: "date", position: 8},  
    {content: "Did I do self devlopment yesterday?", response_type: "boolean", position: 9},  
    {content: "What is your current mood?", response_type: "string", position: 11}, 
    {content: "Are you sick?", response_type: "integer", position: 12},
])

sickness_q = Question.find_by(content: "Are you sick?")
if sickness_q
    puts "Seeing options for: #{sickness_q.content}"

    QuestionOption.create([
        {question: sickness_q, label: "I'm Sick", value: -5},
        {question: sickness_q, label: "Unsure if I'm sick", value: -2},
        {question: sickness_q, label: "Not sick", value: 0},
    ])
end

sleep_q = Question.find_by(content: "How did you sleep?")

if sleep_q
    puts "Seeing options for: #{sleep_q.content}"

    QuestionOption.create([
        {question: sleep_q, label: "Full (7.5+ hrs)", value: 10},
        {question: sleep_q, label: "Good (6-7.5 hrs)", value: 8},
        {question: sleep_q, label: "Interrupted", value: 5},
        {question: sleep_q, label: "Restless/Poor", value: 3},
        {question: sleep_q, label: "No Sleep", value: 0},
])
end

mood_q = Question.find_by(content: "What is your current mood?")

if mood_q 
    puts "Seeding options for: #{mood_q.content}"

    QuestionOption.create ([
        {question: mood_q, label: "Happy", value: "Happy"},
        {question: mood_q, label: "Sad", value: "Sad"},
        {question: mood_q, label: "Productive", value: "Productive"},
        {question: mood_q, label: "Tired", value: "Tired"},
        {question: mood_q, label: "Excited", value: "Excited"},
        {question: mood_q, label: "Depressed", value: "Depressed"},
        {question: mood_q, label: "Anxious", value: "Anxious"},
        {question: mood_q, label: "Calm", value: "Calm"},
        {question: mood_q, label: "Frustrated", value: "Frustrated"},
        {question: mood_q, label: "Overwhelmed", value: "Overwhelmed"},
        {question: mood_q, label: "Neutral", value: "Neutral"},
    ])
end 

trained_Y_N = Question.find_by(content: "Did you train in the last 24 Hours?")
if trained_Y_N 
    puts "Seeding options for: #{trained_Y_N.content}"

    QuestionOption.create([
        {question: trained_Y_N, label: "Yes", value: 1},
        {question: trained_Y_N, label: "No", value: 0},
    ])
end

trained_q = Question.find_by(content:"How intensley did you train?")
if trained_q
    puts "Seeding options for: #{trained_q.content}"

    QuestionOption.create([
        {question: trained_q, label: "Max Effort", value: 10},
        {question: trained_q, label: "Hard", value: 8 },
        {question: trained_q, label: "Moderate", value: 5},
        {question: trained_q, label: "Light", value: 2},
        {question: trained_q, label: "Rest Day", value: 0},
    ])
end

protine_q = Question.find_by(content: "Did you hit your protine goal yesterday?")

if protine_q
    puts "Seeding options for: #{protine_q.content}"

    QuestionOption.create([
        {question: protine_q, label: "Yes", value: 1},
        {question: protine_q, label: "NA", value: 0},
    ])
end

self_dev_q = Question.find_by(content:"Did I do self devlopment yesterday?")
    if self_dev_q
        puts "Seeding options for: #{self_dev_q.content}"

    QuestionOption.create([
        {question: self_dev_q, label: "Yes", value: 1},
        {question: self_dev_q, label: "No", value: 0},
    ])
end

screen_time_q = Question.find_by(content:"How much screen time did I have yesterday?") do |q| 
    question.response_type = 'time'
end

puts "Verified Question : #{screen_time_q.content} (Type: {screen_time_q.response_type})"


# Origonal code block below, new one above

# screen_time_q = Question.find_by(content:"How much screen time did I have yesterday?")
#     if screen_time_q
#         puts "Select Time for: #{screen_time_q.content}"

#     QuestionOption.create([
#         {question: screen_time_q,label: select_time(), value: select_time()},
#     ])
# end

# Believe this is fialing to seed as I not have two input fields from my _hours_minutes form


  

puts "Sucsessfully seeded #{Question.count} questions."
# if I use a mix of integers and floats how easy is it to do analysis on?


