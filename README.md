# Remote Work Check-in Log

## 1. Project Summary
A lightweight web-based application that allows remote team members to submit daily work check-ins. The tool displays all submitted check-ins on a centralized dashboard, supporting asynchronous visibility of daily status across the team.

## 2. Key Objectives
- Enable users to submit one short check-in per day.
- Display daily check-ins in chronological order.
- Provide a clear and minimal UI for fast interaction.
- Include optional search and date filter to locate updates.
- Prevent duplicate entries per user per day.

## 3. Architecture Overview

### 3.1 Core Stack
- **Backend Framework**: Ruby on Rails 8
- **Database**: PostgreSQL
- **Frontend**: Embedded Ruby (ERB) with optional JS enhancements
- **Environment**: Linux (WSL2 Ubuntu 24.04)

### 3.2 System Flow
- User accesses the homepage (`/check_ins`).
- User submits a check-in via form (`POST /check_ins`).
- Application validates and stores the entry.
- Dashboard updates with the new entry.
- Optionally, user can edit or delete own entries.
- Admin-level user can filter/search all logs.

## 4. Models

### CheckIn Model
| Field      | Type     | Description                |
|------------|----------|----------------------------|
| `id`       | Integer  | Primary key                |
| `content`  | Text     | Main check-in message      |
| `user`     | String   | User identifier            |
| `created_at` | DateTime | Timestamp of submission    |
| `updated_at` | DateTime | Timestamp of last modification |

## 5. Functional Requirements

### 5.1 Submit a Check-in
- Users must submit a short message (max 280 characters).
- Each user is limited to one submission per calendar day.

### 5.2 Edit / Delete a Check-in
- Users may modify or delete their own check-in for the current day only.
- No historical edits are allowed for entries older than 24h.

### 5.3 Dashboard
- List all check-ins grouped by date.
- Display includes timestamp and user name.
- Optionally filtered by date or keyword.

### 5.4 Validation Rules
- `content` must be present and ≤ 280 characters.
- Only one check-in per user per day.

## 6. Optional Enhancements

| Feature              | Description                                   |
|----------------------|-----------------------------------------------|
| **Emoji/Markdown Parser** | Converts `:emoji:` or markdown into display |
| **Streak Counter**       | Calculates how many consecutive days logged |
| **Reaction System**      | Users can react with 👍 or emojis            |
| **Search Function**      | Simple keyword search across entries         |
| **Tagging**              | Add optional tags (e.g., #product, #tech)    |

## 7. System Constraints
- Authentication is optional and sessionless in MVP.
- User is identified through session or cookie only.
- Application does not persist user accounts.

## 8. Breakpoints for Testing/Debugging

| Component          | Test/Debug Case                               |
|--------------------|-----------------------------------------------|
| **Duplicate Check-in** | Submit two entries on the same day (expect error) |
| **Long Entry**       | Submit >280 characters (expect validation failure) |
| **Streak logic**     | Break date sequence intentionally             |
| **Edit others' posts** | Try editing a different user’s check-in      |
| **Search edge cases** | Use case-sensitive or blank queries          |

## 9. Directory & File Structure

app/
├── controllers/
│ └── check_ins_controller.rb
├── models/
│ └── check_in.rb
├── views/
│ └── check_ins/
│ ├── index.html.erb
│ ├── new.html.erb
│ ├── edit.html.erb
│ └── _form.html.erb

markdown
Copiar
Editar

## 10. Environment Setup (Linux / WSL)

- **Ruby**: 3.1.4 via RVM
- **Rails**: 8.0.2
- **PostgreSQL + libpq-dev**
- **Node.js**: 18+
- **Yarn**: 1.22+

## 11. Project Creation Command

```bash
rails new remote_checkin --database=postgresql
12. Initial Scaffold Setup (Suggested)
bash
Copiar
Editar
rails g scaffold CheckIn content:text user:string
rails db:create db:migrate
13. Versioning & Branch Strategy
Main Branch: Single main branch for MVP.

Feature Branches: Feature-specific branches for enhancements.

Git Tags: For debugging simulation points:

v0.1-validation-broken

v0.2-permission-leak

v1.0-mvp-complete

r
Copiar
Editar

This `README.md` file outlines all relevant information for the project, including functionality, technical setup, and versioning.







