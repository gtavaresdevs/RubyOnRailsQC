Remote Work Check-in Log
1. Project Overview
The Remote Work Check-in Log is a web-based application designed for remote teams to submit daily work check-ins. This tool allows users to share a brief update on their progress, which is displayed in a centralized, chronological dashboard for easy visibility.

2. Key Features
Daily Check-ins: Users can submit one check-in per day.

Easy Interaction: The UI is simple, focused on efficient check-in submission.

Search & Filter: Allows searching and filtering of check-ins by date or keyword.

Edit/Delete Entries: Users can edit or delete their own check-ins for the current day.

3. Architecture Overview
Core Technologies:
Backend: Ruby on Rails 8

Frontend: Embedded Ruby (ERB) with optional JavaScript enhancements

Database: PostgreSQL

Environment: Linux (WSL2 - Ubuntu 24.04)

Application Flow:
Homepage (/check_ins) - Where users can submit check-ins.

Form Submission: A simple form for check-in submission (POST /check_ins).

Dashboard: Displays all submitted check-ins in chronological order.

Editing & Deleting: Users can edit or delete their own entries for the day.

4. Models
CheckIn Model:

id: Primary key (Integer)

content: Check-in content (Text)

user: User identifier (String)

created_at: Timestamp for submission (DateTime)

updated_at: Timestamp for last modification (DateTime)

5. Functional Requirements
5.1 Submit a Check-in
Content must be present and ≤ 280 characters.

Only one check-in per user per day.

5.2 Edit/Delete a Check-in
Users can edit/delete their own check-ins.

No edits are allowed for check-ins older than 24 hours.

5.3 Dashboard
Displays check-ins grouped by date.

Search and filter functionality based on date or content.

6. Optional Features
Emoji/Markdown Parser: Converts :emoji: to actual emojis.

Streak Counter: Tracks consecutive days of check-ins.

Reaction System: Users can react with emojis.

Search Functionality: Simple keyword search across check-ins.

Tagging: Add tags (e.g., #product, #meeting) to each check-in.

7. Setup & Installation (WSL2 & Visual Studio Code)
Prerequisites:
WSL2 (Ubuntu 24.04) - Install WSL2 and Ubuntu on Windows.

Ruby 3.1.4 - Install Ruby through WSL.

Rails 8 - Install Rails within your WSL2 environment.

PostgreSQL - Set up PostgreSQL as the database.

Step-by-Step Setup:
Clone the repository:

bash
Copiar
Editar
git clone https://github.com/your_username/remote_checkin.git
cd remote_checkin
Install dependencies:

bash
Copiar
Editar
bundle install
yarn install
Setup Database:

bash
Copiar
Editar
rails db:create
rails db:migrate
Start the server:

bash
Copiar
Editar
rails s
Access the app:
Navigate to http://localhost:3000 in your browser.

Using Visual Studio Code with WSL2:
Open the project in Visual Studio Code.

Use the Remote - WSL extension in VS Code to open and edit the files directly within your WSL2 environment.

8. Troubleshooting Steps
Push Errors: If you receive errors like Updates were rejected because the remote contains work that you do not have locally, run:

bash
Copiar
Editar
git pull origin main --rebase
git push -u origin main
This syncs your local changes with the remote repository.

Commit Errors: If you encounter issues during a commit like Unmerged paths:

Resolve conflicts manually or use:

bash
Copiar
Editar
git rebase --continue
Commit your changes and push them again.

Repository not found: If you get errors like fatal: repository not found, ensure the remote URL is correctly configured:

bash
Copiar
Editar
git remote set-url origin https://github.com/your_username/remote_checkin.git
9. Directory Structure
plaintext
Copiar
Editar
app/
├── controllers/
│   └── check_ins_controller.rb
├── models/
│   └── check_in.rb
├── views/
│   └── check_ins/
│       ├── _form.html.erb
│       ├── edit.html.erb
│       ├── index.html.erb
│       ├── new.html.erb
│       └── show.html.erb
config/
├── database.yml
└── routes.rb
db/
├── schema.rb
└── seeds.rb
10. Final Notes
This app is built using Ruby on Rails and PostgreSQL for the backend.

Visual Studio Code with WSL2 is an efficient setup for Windows users to edit and run the project.

Make sure to follow all steps correctly, especially for setting up the database and handling Git issues.