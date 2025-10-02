Unite

A Ruby on Rails application.


📦 Requirements

Make sure you have installed:

Ruby (check .ruby-version for the required version)

Rails (check Gemfile for version)

Bundler (gem install bundler)

PostgreSQL (or your DB of choice)

GitHub CLI (optional, for cloning)


🚀 Getting Started
1. Clone the Repository

You can use GitHub CLI:

gh repo clone Unite-Social/unite
cd unite


Or via SSH:

git clone git@github.com:Unite-Social/unite.git
cd unite

2. Install Dependencies
bundle install

3. Database Setup

Make sure PostgreSQL is running, then run:

bin/rails db:create db:migrate db:seed

4. Run the Server
bin/rails server


Visit: http://localhost:3000

🛠 Useful Commands

Run tests:

bin/rails test


Run console:

bin/rails console


🔑 Environment Variables

Copy .env.example to .env (or configure with config/master.key if Rails credentials are used).

cp .env.example .env


Add your secrets and API keys inside.


🤝 Contributing

Fork this repo

Create a feature branch (git checkout -b feature/my-feature)

Commit changes (git commit -m 'Add my feature')

Push to branch (git push origin feature/my-feature)

Open a Pull Request
![unite-social](https://github.com/user-attachments/assets/8e9562ea-b875-46f5-8b87-5a764e691d66)
