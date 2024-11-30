
# Mediconda: Medicine at Your Fingertips

## Overview
**Mediconda** is a mobile application designed to make medicine search and procurement seamless and efficient. It provides a unified platform for users to search for specific medicines across multiple pharmacies, compare prices, and locate pharmacies that have the required medicine in stock.

With an intuitive user interface and role-based functionality, Mediconda simplifies the process of accessing medicines while empowering pharmacy owners to list their inventory.

---

## Problem We’re Solving
Currently, finding accurate medicine prices and locations is challenging. Users can only search within individual pharmacy chains, which is time-consuming and inefficient. There’s no centralized platform to compare availability or prices across pharmacies.

### Challenges Addressed:
- Lack of centralized information about medicine availability.
- Difficulty in comparing prices across pharmacies.
- Time wasted visiting multiple stores to find essential treatments.

---

## How We’re Solving It
**Mediconda** aggregates data from multiple pharmacies and provides:
- **Real-Time Search**: Instantly search for medicines and view availability across different pharmacies.
- **Price Comparison**: Compare medicine prices to make informed purchasing decisions.
- **Pharmacy Support**: Enables pharmacies to add and manage their inventory through the app.

### Key Features:
1. **Unified Search**:
   - View a list of pharmacies offering the searched medicine.
   - Access pharmacy details, including location and contact information.
2. **Role-Based Functionality**:
   - **Customers**: Search for medicines and compare prices.
   - **Suppliers**: List available medicines and manage inventory.
3. **User-Friendly Design**:
   - Intuitive screens guiding users through medicine search, selection, and purchase processes.
4. **Notifications & Favorites**:
   - Add medicines to favorites for easy access.
   - Receive notifications about medicine availability.

---

## User Flow
1. **Choose Your Role**:
   - Select between **Customer** or **Supplier** during account setup.
2. **Search Medicines**:
   - Type the name of the medicine to see a list of options with prices and pharmacy locations.
3. **Manage Inventory (For Suppliers)**:
   - Add or update available medicines and quantities.

### Screenshots
- **Home Screen**: Easy navigation to search for medicines.
- **Search Results**: List of pharmacies with price and stock details.
- **Pharmacy Details**: Comprehensive information about selected pharmacies, including location maps.
- **Notifications & Favorites**: Tools to enhance the user experience.

---

## Backend Overview
The backend of Mediconda is powered by **Flask**, providing a robust and scalable architecture:
- **Python & Flask**: Lightweight and efficient web framework.
- **RESTful APIs**: Seamless client-server communication.
- **JWT Authentication**: Secure user authentication and session management.
- **SQLAlchemy ORM**: Handles database operations with integrity.
- **AWS EC2**: Scalable deployment infrastructure for high performance.

### Core Functionalities:
- User registration and role-based authentication.
- Data processing and secure retrieval.
- Real-time updates of medicine availability.

---

## Presentation Link
[Click here to view our presentation on Canva](https://www.canva.com/design/DAGUcGt9kzY/LwAZUaMNjj1r6oz_jTMzUw/edit?utm_content=DAGUcGt9kzY&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)
