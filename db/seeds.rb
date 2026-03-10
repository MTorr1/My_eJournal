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
Question.destroy_all

Question.create!([
    {content: "How did you sleep?", response_type: "integer", position: 1},
    {content: "Did you train in the last 24 Hours?", response_type: "boolean", position: 2}, # Need to look at this and Q3 as Parent child logic in future
    {content: "How intensley did you train ", response_type: "integer", position: 3}, # Need to look at this and Q2 as Parent child logic in future
    {content: "Did you hit your protine goal yesterday?", response_type: "boolean", position: 4}, 
    {content: "How much screen time did I have yesterday?", response_type: "float", position: 5}, # I would like to try API this data in the future
    {content: "Did anything happen yesterday to make me feel worse?", response_type: "boolean", position: 6}, # Need to look at this and Q7 as Parent child logic in future
    {content: "What happened to make you feel bad?", response_type: "string", position: 7},# Need to look at this and Q6 as Parent child logic in future
    {content: "When did you last see friends?", response_type: "date", position: 8},  
    {content: "Did I do self devlopment yesterday?", response_type: "boolean", position: 9},  
    {content: "How do you feel?", response_type: "float", position: 10},  
    {content: "What is your current mood?", response_type: "string", position: 11}, 
])

mood_q = Question.find_by(content: "What is your current mood?")

if mood_q 
    puts "Seeding options for: #{mood_q.content}"

    QuestionOption.create ([
        {question: mood_q, label: "Happy"},
        {question: mood_q, label: "Sad"},
        {question: mood_q, label: "Productive"},
        {question: mood_q, label: "Tired"},
        {question: mood_q, label: "Excited"},
        {question: mood_q, label: "Depressed"},
        {question: mood_q, label: "Anxious"},
        {question: mood_q, label: "Calm"},
        {question: mood_q, label: "Frustrated"},
        {question: mood_q, label: "Overwhelmed"},
    ])
end 

trained_q = Question.find_by(content: "Did you train in the last 24 Hours?")

if trained_q
    puts "Seeding options for: #{trained_q.content}"

    QuestionOption.create ([
        {question: trained_q, label: "Yes", value: 1},
        {question: trained_q, label: "No", value: 0 },
    ])
end

protine_q = Question.find_by(content: "Did you hit your protine goal yesterday?")

if protine_q
    puts "Seeding options for: #{protine_q.content}"

    QuestionOption.create([
        {question: protine_q, label: "Yes", value: 1},
        {question: protine_q, label: "No", value: 0},
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

puts "Sucsessfully seeded #{Question.count} questions."
# if I use a mix of integers and floats how easy is it to do analysis on?