# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { email: 'lina@example.com', password: 'password' },
                       { email: 'alex@example.com', password: 'password' },
                       { email: 'ariana@example.com', password: 'password' },
                       { email: 'andrey@example.com', password: 'password' }
                     ])

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Database' }
                              ])

tests = Test.create!([
                       { title: 'Ruby', level: 1, category: categories[1], author: users[1] },
                       { title: 'JavaScript', level: 1, category: categories[0], author: users[1] },
                       { title: 'C#', level: 2, category: categories[1], author: users[1] },
                       { title: 'HTML', level: 1, category: categories[0], author: users[1] },
                       { title: 'SSL', level: 1, category: categories[2], author: users[1] }
                     ])

questions = Question.create!([
                               { body: 'What are the methods for the loop?', test: tests[0] },
                               { body: 'What is the <a> tag used for?', test: tests[3] },
                               { body: 'How to create a database?', test: tests[4] },
                               { body: 'What is the <body> tag used for?', test: tests[3] },
                               { body: 'What is the <p> tag used for?', test: tests[3] }
                             ])

Answer.create!([
                 { body: 'CREATE DATABASE name', question: questions[1], correct: true },
                 { body: 'UPDATE DATABASE name', question: questions[1] },
                 { body: 'CREATE TABLE name', question: questions[1] },
                 { body: 'for, while, loop...', question: questions[0], correct: true },
                 { body: 'if, def... ', question: questions[0] }
               ])

PassedTest.create!({ user: User.first, test: Test.first, points: 10 })
PassedTest.create!({ user: User.first, test: Test.last, points: 10 })
