# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item = TodoItem.create(text: 'test1')
item2 = TodoItem.create(text: 'test2')
TodoItem.create(text: 'test3')
TodoItem.create(text: 'test4')
TodoItem.create(text: 'test5')

TodoComment.create(todo_item: item, text: 'comment 1')
TodoComment.create(todo_item: item, text: 'comment 2')
TodoComment.create(todo_item: item2, text: 'comment 3')
TodoComment.create(todo_item: item, text: 'comment 4')
TodoComment.create(todo_item: item2, text: 'comment 5')