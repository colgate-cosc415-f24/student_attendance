# README

Student attendance system example app - COSC415 Fall '24

Created with: `rails new student_attendance -T --skip-ci --skip-foreman --skip-devcontainer`


Preflight:
```
bundle config without production
bundle install
rails db:migrate
rails db:seed
```

Start dev server with: `rails server`

---

## Changelog

9/25

  - Add `resources :students` to `config/routes.rb` and root route to `students#index`
  - Add `Student` model with generator: `rails g model Student first:string last:string homeroom:string graduation_year:integer`

9/26

  - Run `rails g controller StudentsController` to create a basic controller class in `app/controllers/students_controller.rb`

  - Copy students index template from slides to `app/views/students/index.html.erb`

10/2

  - Index route/view done
  - Some code for show view but not complete

10/7

  - Finish index view, add basic show view
  - add new view/controller

10/9

  - new/create actions complete

10/10

  - add rspec/simplecov and configure them (but no tests yet)

10/11

  - edit/update and destroy routes

10/19

  - prep cucumber 
  - add model spec for #name method
  - start system specs for StudentsController methods

10/21

  - cucumber scenario for search

10/26

  - start sad path for new/create

10/27

  - fill in sad path, get app to full C0 coverage
