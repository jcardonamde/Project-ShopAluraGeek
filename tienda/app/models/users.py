from app.config.mysqlconnection import connectToMySQL
from flask import flash

import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')

class User:
    def __init__(self, data):
        self.id = data ['id']
        self.name = data['name']
        self.last_name = data['last_name']
        self.email = data['email']
        self.password = data['password']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']
        
    @classmethod
    def save(cls, formulario):
        query = "INSERT INTO users (name, last_name, email, password) VALUES (%(name)s, %(last_name)s, %(email)s, %(password)s)"
        result = connectToMySQL('esquema_tienda_geek').query_db(query, formulario)
        return result
    
    @classmethod
    def get_by_email(cls, formulario):
        query = "SELECT * FROM users WHERE email = %(email)s;"
        result = connectToMySQL('esquema_tienda_geek').query_db(query, formulario)
        if len(result) < 1:
            return False
        else:
            user = cls(result[0])
            return user
        
    @classmethod
    def get_by_id(cls, formulario):
        query = "SELECT * FROM users WHERE id = %(id)s;"
        result = connectToMySQL('esquema_tienda_geek').query_db(query, formulario)
        user = cls(result[0])
        return user
    
    @classmethod
    def update(cls, formulario):
        query = "UPDATE users SET name = %(name)s, last_name = %(last_name)s, email = %(email)s, password = %(password)s WHERE id = %(id)s"
        result = connectToMySQL('esquema_tienda_geek').query_db(query, formulario)
        return result
    
    @staticmethod
    def validate_user(formulario):
        is_valid = True
        
        if len(formulario['name']) < 3:
            flash('Name must have at least 3 characters', 'registro')
            is_valid = False
            
        if len(formulario['last_name']) < 3:
            flash('Last Name must have at least 3 characters', 'registro')
            is_valid = False
        
        # Valid email address with regular expressions
        if not EMAIL_REGEX.match(formulario['email']):
            flash('Email invalido, por favor verifique que el email este correcto', 'registro')
            is_valid = False
        
        if len(formulario['password']) < 8:
            flash('La contraseña debe tener como minimo 8 caracteres', 'registro')
            is_valid = False
        
        if formulario['password'] != formulario['confirm_password']:
            flash('Las contraseñas no coinciden, por favor verifique la información', 'registro')
            is_valid = False
            
        # query = "SELECT * FROM users WHERE email = %(email)s"
        # results = connectToMySQL('esquema_tienda_geek').query_db(query, formulario)
        # if len(results) >= 1:
        #     flash('Email registrado previamente', 'registro')
        #     is_valid = False
            
        return is_valid