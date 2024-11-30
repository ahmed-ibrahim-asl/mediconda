
# Flask Medicine Management API

## Overview
This project is a Flask-based RESTful API designed for managing user accounts, user profiles, and medicine records. It supports role-based access control, where users can either be `normal` or `suppliers`.

---

## Features
- **User Registration & Authentication**:
  - Users can register and log in to obtain JWT tokens.
  - Authentication is required for most actions.
- **User Profiles**:
  - Users can view and update their profiles.
- **Medicine Management**:
  - Suppliers can add medicines to the database.
  - All users can search and view medicine records.
- **Role-Based Access Control**:
  - Suppliers have permissions to manage medicines.
  - Normal users can only search and view records.

---

## Project Structure

```
.
├── app/
│   ├── __init__.py            # App initialization and Blueprint registration
│   ├── models.py              # Database models (User and Medicine)
│   ├── routes/
│   │   ├── auth_routes.py     # Routes for authentication
│   │   ├── profile_routes.py  # Routes for user profile management
│   │   ├── medicine_routes.py # Routes for medicine management
│   ├── utils/
│   │   ├── helpers.py         # Placeholder for helper functions
├── config.py                  # Application configuration
├── requirements.txt           # Python dependencies
├── run.py                     # Entry point for the application
├── testing.py                 # API testing script
```

---

## Installation

### Prerequisites
- Python 3.8 or higher
- pip (Python package manager)

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo-url.git
   cd your-repo-folder
   ```

2. Create a virtual environment and activate it:
   ```bash
   python -m venv venv
   source venv/bin/activate   # On Windows: venv\Scripts\activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Set up the database:
   ```bash
   flask db init
   flask db migrate
   flask db upgrade
   ```

5. Run the application:
   ```bash
   python run.py
   ```

---

## Configuration
The application uses a `Config` class to manage settings:
- `SECRET_KEY`: Secret for session management.
- `JWT_SECRET_KEY`: Secret for JWT tokens.
- `SQLALCHEMY_DATABASE_URI`: Database connection URI (SQLite by default).

Set environment variables or modify `config.py` for production.

---

## API Endpoints

### Authentication
- **POST `/api/auth/register`**: Register a new user.
- **POST `/api/auth/login`**: Log in and obtain a JWT token.

### Profile
- **GET `/api/profile/`**: Get the logged-in user's profile.
- **PUT `/api/profile/`**: Update the logged-in user's profile.

### Medicines
- **GET `/api/medicines/`**: Retrieve all medicines.
- **GET `/api/medicines/search?q=<query>`**: Search for medicines by name.
- **POST `/api/medicines/`**: Add a new medicine (suppliers only).

---

## Testing
Use `testing.py` to test the API:
```bash
python testing.py
```
This script automates:
- User registration and login.
- Profile retrieval and updates.
- Medicine management (adding, searching, viewing).

---

## Database Models

### User
- **Fields**:
  - `id`: Primary key.
  - `email`: User's email (unique).
  - `password_hash`: Hashed password.
  - `phone_number`: Contact number.
  - `user_type`: Role (`normal` or `supplier`).

- **Methods**:
  - `set_password(password)`: Hashes and sets the password.
  - `check_password(password)`: Verifies the password.

### Medicine
- **Fields**:
  - `id`: Primary key.
  - `name`: Name of the medicine.
  - `price`: Price of the medicine.
  - `pharmacy_name`: Name of the pharmacy supplying the medicine.
  - `location_link`: Link to the pharmacy's location.

---

## Notes
- The project is structured for scalability using Blueprints.
- The database schema is managed using Flask-Migrate.
- Ensure secure secrets for production deployments.

---

## License
This project is licensed under the MIT License.
