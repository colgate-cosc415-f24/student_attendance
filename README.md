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
