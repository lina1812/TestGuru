# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
               { name: 'Lina', password: 'password' },
               { name: 'Alex', password: 'password' },
               { name: 'Ariana', password: 'password' },
               { name: 'Andrey', password: 'password' }
             ])

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Database' }
                              ])

tests = Test.create!([
                       { title: 'Ruby', level: 1, category_id: categories[1].id, author_id: users[1].id },
                       { title: 'JavaScript', level: 1, category_id: categories[0].id, author_id: users[1].id },
                       { title: 'C#', level: 2, category_id: categories[1].id, author_id: users[1].id },
                       { title: 'HTML', level: 1, category_id: categories[0].id, author_id: users[1].id },
                       { title: 'SSL', level: 1, category_id: categories[2].id, author_id: users[1].id }
                     ])

questions = Question.create!([
                               { body: 'What are the methods for the loop?', test_id: tests[0].id},
                               {  body: 'What is the <a> tag used for?', test_id: tests[3].id },
                               { body: 'How to create a database?', test_id: tests[4].id },
                               { body: 'What is the <body> tag used for?', test_id: tests[3].id },
                               { body: 'What is the <p> tag used for?', test_id: tests[3].id }
                             ])

Answer.create!([
                 { body: 'CREATE DATABASE name', question_id: questions[1].id, correct: true },
                 { body: 'UPDATE DATABASE name', question_id: questions[1].id },
                 { body: 'CREATE TABLE name', question_id: questions[1].id },
                 { body: 'for, while, loop...', question_id: questions[0].id, correct: true },
                 { body: 'if, def... ', question_id: questions[0].id }
               ])

PassedTest.create!({ user: User.first, test: Test.first, points: 10 })
PassedTest.create!({ user: User.first, test: Test.last, points: 10 })
