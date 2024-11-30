# app/routes/medicine_routes.py

from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity  # Import for JWT handling
from ..models import Medicine, User  # Import User model
from .. import db

medicine_bp = Blueprint('medicine_bp', __name__)

@medicine_bp.route('/', methods=['GET'])
def get_medicines():
    medicines = Medicine.query.all()
    result = [{
        'id': med.id,
        'name': med.name,
        'price': med.price,
        'pharmacy_name': med.pharmacy_name,
        'location_link': med.location_link
    } for med in medicines]

    return jsonify(result), 200

@medicine_bp.route('/search', methods=['GET'])
def search_medicines():
    query = request.args.get('q', '')
    medicines = Medicine.query.filter(Medicine.name.ilike(f'%{query}%')).all()
    result = [{
        'id': med.id,
        'name': med.name,
        'price': med.price,
        'pharmacy_name': med.pharmacy_name,
        'location_link': med.location_link
    } for med in medicines]

    return jsonify(result), 200

@medicine_bp.route('/', methods=['POST'])
@jwt_required()  # Require authentication
def add_medicine():
    current_user_id = get_jwt_identity()
    current_user = User.query.get(current_user_id)

    # Ensure current_user exists
    if not current_user:
        return jsonify({'message': 'User not found.'}), 404

    # Permission check: Only allow suppliers to add medicine
    if current_user.user_type.lower() != 'supplier':
        return jsonify({'message': 'Permission denied.'}), 403

    data = request.get_json()
    name = data.get('name')
    price = data.get('price')
    pharmacy_name = data.get('pharmacy_name')
    location_link = data.get('location_link')

    # Validate required fields
    if not all([name, price, pharmacy_name]):
        return jsonify({'message': 'Missing required fields.'}), 400

    medicine = Medicine(
        name=name,
        price=price,
        pharmacy_name=pharmacy_name,
        location_link=location_link
    )

    db.session.add(medicine)
    db.session.commit()

    return jsonify({'message': 'Medicine added successfully.'}), 201
