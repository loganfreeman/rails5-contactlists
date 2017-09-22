## Technologies used

[`Ruby`](https://www.ruby-lang.org/en/) [`Rails`](http://guides.rubyonrails.org/getting_started.html) [`RSpec`](http://rspec.info/) [`Postgres`](https://www.postgresql.org/) [`Materialize`](http://materializecss.com/)

## Running the project
1. Clone the repo: `$ git clone [URL]`

2. Install dependencies: `$ bundle`

3. Create the databases: `$ rake db:create`

4. Create the tables: `$ rake db:migrate`

5. Run the app: `$ rails server`

6. Navigate to [http://localhost:3000/](http://localhost:3000/)

Use `$ rspec` to run tests

##  .env

add .env to the root directory with the following content:

```
TOKEN=d3ef07cd3fb17859a874b7854c84f0ec
```
