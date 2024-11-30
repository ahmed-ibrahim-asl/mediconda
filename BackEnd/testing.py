import requests
import json

BASE_URL = "http://16.170.255.231:5000"

# Users to be registered for testing
TEST_USERS = [
    {
        "email": "ahmed@gmail.com",
        "password": "password123",
        "phone_number": "1111111111",
        "user_type": "normal"
    },
    {
        "email": "asl@example.com",
        "password": "supplierpass",
        "phone_number": "2222222222",
        "user_type": "supplier"
    }
]

#! For debugging purposes
def print_test_result(test_name, success, response=None):
    status = "PASSED" if success else "FAILED"
    print(f"[{status}] {test_name}")
    if response:
        print(f"Status Code: {response.status_code}")
        print(f"Response: {response.json()}\n")
    else:
        print()


def register_user(user_data):
    url = f"{BASE_URL}/api/auth/register"
   
    response = requests.post(url, json=user_data)
   
    is_success = (response.status_code == 201)

    print_test_result(f"Register User ({user_data['email']})", is_success, response)
   
    return is_success

def login_user(email, password):
    
    url = f"{BASE_URL}/api/auth/login"
    
    data = {
        "email": email,
        "password": password
    }
   
    response = requests.post(url, json=data)
    is_success = response.status_code == 200
    
        
    if (is_success):
        access_token = response.json().get('access_token')
        print_test_result(f"Login User ({email})", is_success)
        return access_token
    
    else:
        print_test_result(f"Login User ({email})", is_success, response)
        return None

def get_user_profile(access_token):
    url = f"{BASE_URL}/api/profile/"
    
    headers = {
        "Authorization": f"Bearer {access_token}"
    }
    
    response = requests.get(url, headers=headers)
    is_success = response.status_code == 200
    

    print_test_result("Get User Profile", is_success, response)

def edit_user_profile(access_token, update_data):
    url = f"{BASE_URL}/api/profile/"
    
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Content-Type": "application/json"
    }
    
    response = requests.put(url, headers=headers, json=update_data)
    is_success = (response.status_code == 200)
    
    
    print_test_result("Edit User Profile", is_success, response)

def add_medicine(access_token, medicine_data):
    url = f"{BASE_URL}/api/medicines/"
    
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Content-Type": "application/json"
    }
    
    response = requests.post(url, headers=headers, json=medicine_data)
    is_success = (response.status_code == 201)
    
    
    print_test_result("Add Medicine", is_success, response)

def get_all_medicines():
    url = f"{BASE_URL}/api/medicines/"
    
    response = requests.get(url)
    is_success = (response.status_code == 200)
    
    
    print_test_result("Get All Medicines", is_success, response)

def search_medicines(query):
    url = f"{BASE_URL}/api/medicines/search?q={query}"
    
    response = requests.get(url)
    is_success = (response.status_code == 200)
    
    
    print_test_result(f"Search Medicines (query='{query}')", is_success, response)

def attempt_add_medicine_as_normal_user(access_token, medicine_data):
    url = f"{BASE_URL}/api/medicines/"
    
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Content-Type": "application/json"
    }
    
    response = requests.post(url, headers=headers, json=medicine_data)
    is_success = (response.status_code == 403)
    
    
    print_test_result("Attempt Add Medicine as Normal User (should fail)", is_success, response)

def main():
    print("=== Starting API Tests ===\n")

    # Register users
    for user in TEST_USERS:
        register_user(user)

    # Login users and store tokens
    tokens = {}
    for user in TEST_USERS:
        token = login_user(user['email'], user['password'])
        if token:
            tokens[user['user_type']] = token
        else:
            print(f"Error: Could not log in user {user['email']}. Tests cannot proceed.")
            return

    # Get user profiles
    get_user_profile(tokens['normal'])
    get_user_profile(tokens['supplier'])

    # Edit user profile (normal user)
    edit_user_profile(tokens['normal'], {"phone_number": "9999999999", "password": "newpassword"})

    # Add medicine as supplier
    medicine_data = {
        "name": "Paracetamol",
        "price": 5.99,
        "pharmacy_name": "Good Health Pharmacy",
        "location_link": "https://maps.google.com/?q=location"
    }
    add_medicine(tokens['supplier'], medicine_data)

    # Attempt to add medicine as normal user (should fail)
    attempt_add_medicine_as_normal_user(tokens['normal'], medicine_data)

    # Get all medicines
    get_all_medicines()

    # Search for medicines
    search_medicines("Paracetamol")
    search_medicines("NonExistingMedicine")

    print("=== API Tests Completed ===")

if __name__ == "__main__":
    main()
