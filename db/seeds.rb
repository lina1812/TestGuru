# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
              { name: 'Lina', password: 'password', role: 'admin' },
              { name: 'Alex', password: 'password', role: 'admin' },
              { name: 'Ariana', password: 'password', role: 'user' },
              { name: 'Andrey', password: 'password', role: 'user' }
            ])

Category.create([
                  { title: 'Frontend' },
                  { title: 'Backend' },
                  { title: 'Database' }
                ])

Test.create([
              { title: 'Ruby', level: 1, category: Category.where(title: 'Backend').first },
              { title: 'JavaScript', level: 1, category: Category.where(title: 'Frontend').first },
              { title: 'C#', level: 2, category: Category.where(title: 'Backend').first },
              { title: 'HTML', level: 1, category: Category.where(title: 'Frontend').first },
              { title: 'SSL', level: 1, category: Category.where(title: 'Database').first }
            ])

Question.create([
                  { body: 'What is the <a> tag used for?', test: Test.where(title: 'HTML').first },
                  { body: 'How to create a database?', test: Test.where(title: 'SSL').first },
                  { body: 'What are the methods for the loop?', test: Test.where(title: 'Ruby').first },
                  { body: 'What is the <body> tag used for?', test: Test.where(title: 'HTML').first },
                  { body: 'What is the <p> tag used for?', test: Test.where(title: 'HTML').first }
                ])

Answer.create([
                { body: 'CREATE DATABASE name', question: Question.where(body: 'How to create a database?').first, correct: true },
                { body: 'UPDATE DATABASE name', question: Question.where(body: 'How to create a database?').first },
                { body: 'CREATE TABLE name', question: Question.where(body: 'How to create a database?').first },
                { body: 'for, while, loop...', question: Question.where(body: 'What are the methods for the loop?').first, correct: true },
                { body: 'if, def... ', question: Question.where(body: 'What are the methods for the loop?').first }
              ])

Passed_tests.create({ user: User.first, test: Test.first, points: 10 })
