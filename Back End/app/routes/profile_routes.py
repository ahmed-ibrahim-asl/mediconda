from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity
from ..models import User
from .. import db

profile_bp = Blueprint('profile_bp', __name__)

@profile_bp.route('/', methods=['GET'])
@jwt_required()
def get_profile():
    user_id = get_jwt_identity()
    user = User.query.get(user_id)

    if not user:
        return jsonify({'message': 'User not found.'}), 404

    return jsonify({
        'email': user.email,
        'phone_number': user.phone_number,
        'user_type': user.user_type
    }), 200

@profile_bp.route('/', methods=['PUT'])
@jwt_required()
def edit_profile():
    user_id = get_jwt_identity()
    user = User.query.get(user_id)
    data = request.get_json()

    if not user:
        return jsonify({'message': 'User not found.'}), 404

    user.phone_number = data.get('phone_number', user.phone_number)
    user.user_type = data.get('user_type', user.user_type)

    if 'password' in data:
        user.set_password(data['password'])

    db.session.commit()
    return jsonify({'message': 'Profile updated successfully.'}), 200
