# 📘 **Remote Work Check-in Log**

## 🌟 **Project Overview**

**Remote Work Check-in Log** is a lightweight web-based application that enables remote team members to submit daily work check-ins. This tool allows the team to track daily progress asynchronously, providing visibility on the status of each team member.

---

## 🎯 **Key Objectives**

* **Submit a Check-in**: Users can submit one short check-in per day.
* **Display Check-ins**: All check-ins are displayed in chronological order.
* **Minimal UI**: Designed for fast interaction and ease of use.
* **Search & Filter**: Optional filters to locate updates by keyword or date.
* **Prevent Duplicate Entries**: Only one check-in per user per day.

---

## ⚙️ **Architecture Overview**

### **Core Stack**:

* **Backend Framework**: Ruby on Rails 8
* **Database**: PostgreSQL
* **Frontend**: Embedded Ruby (ERB) with optional JavaScript enhancements
* **Environment**: Linux (WSL2 Ubuntu 24.04)

### **System Flow**:

1. **Homepage Access**: User accesses `/check_ins`.
2. **Submit Check-in**: User submits via a form (`POST /check_ins`).
3. **Validate & Store**: Application validates the input and stores the entry.
4. **Dashboard Update**: The dashboard updates with the latest entry.
5. **Edit/Delete**: User can edit or delete their own entries.
6. **Admin Features**: Admin can filter/search all logs.

---

## 🧑‍💻 **Models Overview**

### **CheckIn Model**:

| **Field**   | **Type** | **Description**                |
| ----------- | -------- | ------------------------------ |
| id          | Integer  | Primary key                    |
| content     | Text     | Main check-in message          |
| user        | String   | User identifier                |
| created\_at | DateTime | Timestamp of submission        |
| updated\_at | DateTime | Timestamp of last modification |

---

## ✅ **Functional Requirements**

### 1. **Submit a Check-in**:

* Users can submit a short message (≤ 280 characters).
* Only one check-in per user per day.

### 2. **Edit/Delete a Check-in**:

* Users can edit or delete only their current day's check-in.

### 3. **Dashboard**:

* Lists all check-ins by date.
* Displays timestamp and user name.
* Optionally filtered by date or keyword.

### 4. **Validation Rules**:

* `content` must be ≤ 280 characters.
* Only one check-in per user per day.

---

## 💡 **Optional Enhancements**

| **Feature**           | **Description**                             |
| --------------------- | ------------------------------------------- |
| Emoji/Markdown Parser | Converts `:emoji:` or markdown into display |
| Streak Counter        | Displays consecutive days logged            |
| Reaction System       | Users can react with 👍 or other emojis     |
| Search Function       | Simple keyword search across entries        |
| Tagging               | Add optional tags (e.g., #product)          |

---

## 🚧 **System Constraints**

* **Authentication**: Authentication is optional in MVP; user identified through session or cookie.
* **Persistence**: No permanent user accounts are stored.

---

## 🛠️ **Troubleshooting / Common Errors**

Here’s a summary of common issues faced during development and their fixes:

1. **Error: `fatal: 'origin' does not appear to be a git repository`**

   * **Solution**: Add the correct remote URL:

     ```bash
     git remote add origin https://github.com/your_username/remote_checkin.git
     ```

2. **Error: `fatal: repository not found`**

   * **Solution**: Set the correct remote URL and push again:

     ```bash
     git remote set-url origin https://github.com/your_username/remote_checkin.git
     ```

3. **Error: `Updates were rejected because the remote contains work that you do not have locally`**

   * **Solution**: Pull the latest changes before pushing:

     ```bash
     git pull origin main --rebase
     ```

4. **Error: `git commit` failed due to unmerged files**

   * **Solution**: Resolve conflicts and commit:

     ```bash
     git add <conflicted_file>
     git commit -m "Resolved merge conflicts"
     ```

5. **Error: `fatal: repository 'https://github.com/...git' not found`**

   * **Solution**: Ensure that the repository URL is correct and that you have access.

6. **Error: `Webpacker not installed`**

   * **Solution**: Install Webpacker:

     ```bash
     rails webpacker:install
     ```

---

## 🌍 **Setting Up Locally with WSL2 (Ubuntu)**

To run the project locally on a **Windows machine using WSL2 and Ubuntu**:

1. **Install WSL2**:

   * Open PowerShell and run:

     ```bash
     wsl --set-default-version 2
     ```

2. **Install Ubuntu** from Microsoft Store.

3. **Install Dependencies**:

   * **Install Ruby**:

     ```bash
     sudo apt install ruby-full
     ```
   * **Install Rails**:

     ```bash
     gem install rails
     ```
   * **Install PostgreSQL**:

     ```bash
     sudo apt install postgresql postgresql-contrib libpq-dev
     ```
   * **Install Node.js and Yarn**:

     ```bash
     curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
     sudo apt install -y nodejs
     npm install --global yarn
     ```

4. **Clone the Repository**:

   * Open WSL2 Ubuntu, and run:

     ```bash
     git clone https://github.com/your_username/remote_checkin.git
     cd remote_checkin
     ```

5. **Set up Database**:

   * Configure your `config/database.yml` file with PostgreSQL settings, then run:

     ```bash
     rails db:create db:migrate
     ```

6. **Start the Rails Server**:

   * Run the server:

     ```bash
     rails server
     ```
   * Visit `http://localhost:3000` in your browser.

---

## 📂 **Directory & File Structure**

```plaintext
app/
├── controllers/
│   └── check_ins_controller.rb
├── models/
│   └── check_in.rb
│   └── user.rb
├── views/
│   └── check_ins/
│       ├── index.html.erb
│       ├── edit.html.erb
│       ├── new.html.erb
│       └── _form.html.erb
config/
├── routes.rb
└── database.yml
db/
├── migrate/
├── schema.rb
└── seeds.rb
```

---

## 📝 **Project Creation Command**

To create the project:

```bash
rails new remote_checkin --database=postgresql
```

For scaffolding the **CheckIn** model:

```bash
rails g scaffold CheckIn content:text user:string
rails db:create db:migrate
```

---

## 🔖 **Versioning & Branch Strategy**

* Use a single **main** branch for MVP.
* Create **feature-specific branches** for future enhancements.
* Use **Git tags** for important milestones, like:

  * `v1.0-mvp-complete`

---

## 🚀 **To Contribute**

1. **Clone** the repository:

   ```bash
   git clone https://github.com/your_username/remote_checkin.git
   ```
2. **Create a new branch** for your feature:

   ```bash
   git checkout -b feature-name
   ```
3. **Commit your changes** and **push**:

   ```bash
   git add .
   git commit -m "Add new feature"
   git push origin feature-name
   ```

---

**Enjoy building your check-in tool!** 🛠️
