# app/__init__.py

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_jwt_extended import JWTManager
from flask_cors import CORS
from flask_migrate import Migrate  # Import Flask-Migrate
from config import config




db = SQLAlchemy()
jwt = JWTManager()
migrate = Migrate()  # Initialize Migrate object

def create_app(config_name='development'):
    app = Flask(__name__)
    app.config.from_object(config[config_name])

    # Initialize extensions
    db.init_app(app)
    jwt.init_app(app)
    CORS(app)
    migrate.init_app(app, db)  # Bind Flask-Migrate to app and db

    # Import models to ensure they are registered
    from .models import User, Medicine

    # Register Blueprints
    from .routes.auth_routes import auth_bp
    from .routes.profile_routes import profile_bp
    from .routes.medicine_routes import medicine_bp

    app.register_blueprint(auth_bp, url_prefix='/api/auth')
    app.register_blueprint(profile_bp, url_prefix='/api/profile')
    app.register_blueprint(medicine_bp, url_prefix='/api/medicines')

    # Remove db.create_all(), as migrations will handle database creation
    # with app.app_context():
    #     db.create_all()

    return app
