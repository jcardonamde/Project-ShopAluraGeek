from app.config.mysqlconnection import connectToMySQL
from flask import flash
from datetime import *

class Product:
    def __init__(self, data):
        self.id = data ['id']
        self.name_prod = data['name_prod']
        self.description = data['description']
        self.price_prod = data['price_prod']
        self.category = data['category']
        self.favorite = data['favorite']
        self.url_img = data['url_img']
        self.publication_expiration = data['publication_expiration']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']
        self.user_id = data['user_id']
        
    def time_validator(self):
        now = datetime.today()
        return now
    
    @classmethod
    def save(cls, formulario):
        query = "INSERT INTO products (name_prod, description, price_prod, category, favorite, url_img, publication_expiration, user_id) VALUES (%(name_prod)s, %(description)s, %(price_prod)s, %(category)s, %(favorite)s, %(url_img)s, %(publication_expiration)s, %(user_id)s)"
        newId = connectToMySQL('esquema_tienda_geek').query_db(query, formulario)
        return newId
    
    @classmethod
    def get_products_by_user(cls, formulario):
        query = "SELECT products.*, name_prod FROM products LEFT JOIN users ON users.id = products.user_id WHERE user_id = %(id)s;"
        results = connectToMySQL('esquema_tienda_geek').query_db(query, formulario)
        products = []
        for product in results:
            products.append(cls(product))
        return products

    @classmethod
    def get_by_id_product(cls, formulario):
        query = "SELECT products.*, name_prod FROM products LEFT JOIN users ON users.id = products.user_id WHERE products.id = %(id)s"
        result = connectToMySQL('esquema_tienda_geek').query_db(query, formulario)
        product = cls(result[0])
        return product

    @classmethod
    def delete(cls, formulario):
        query = "DELETE FROM products WHERE id = %(id)s"
        result = connectToMySQL('esquema_tienda_geek').query_db(query, formulario)
        return result
    
    @classmethod
    def update(cls, formulario):
        query = "UPDATE products SET name_prod = %(name_prod)s, description = %(description)s, price_prod = %(price_prod)s, category = %(category)s, favorite = %(favorite)s, url_img = %(url_img)s, publication_expiration = %(publication_expiration)s WHERE id = %(id)s"
        result = connectToMySQL('esquema_tienda_geek').query_db(query, formulario)
        return result
    
    @staticmethod
    def validate_product(formulario):
        is_valid = True
        
        if len(formulario['name_prod']) < 3:
            flash('The product name must have at least 3 characters', "producto")
            is_valid = False
        
        if len(formulario['description']) < 3:
            flash('The description must have at least 3 characters', "producto")
            is_valid = False    
        
        if len(formulario['price_prod']) <= 0 or formulario['price_prod'] == "":
            flash('The price must be greater than zero', "producto")
            is_valid = False
            
        if len(formulario['category']) < 1:
            flash('Must choose a category', "producto")
            is_valid = False
            
        if len(formulario['url_img']) < 3:
            flash('The URL image must have at least 3 characters', "producto")
            is_valid = False  
        
        if formulario['publication_expiration'] == "":
            flash("Please enter a date", "producto")
            is_valid = False
            
        return is_valid