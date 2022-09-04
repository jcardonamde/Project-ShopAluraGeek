from app import app
from flask import render_template, redirect, session, request, flash, jsonify
from flask_mail import Mail, Message
from app.email import welcome_mail
from app.models.users import User
from app.models.products import Product

from flask_bcrypt import Bcrypt
bcrypt = Bcrypt(app)
mail = Mail(app)

@app.errorhandler(404)
def page_not_found(error):
    return render_template('errors/404.html'), 404 #status200

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login_user')
def login_user():
    return render_template('login_user.html')

@app.route('/login', methods = ['POST'])
def login():
    user = User.get_by_email(request.form)
    if not user:
        return jsonify(message = "E-mail no encontrado. Por favor ingrese una cuenta valida")
    
    if not bcrypt.check_password_hash(user.password, request.form['password']):
        return jsonify(message = "Password incorrecto. Por favor verifique las credenciales ingresadas")
    
    session['usuario_id'] = user.id
    return jsonify(message = "Login Correcto")


@app.route('/register')
def register_user():
    return render_template('register_user.html')

@app.route('/register_new_user', methods=['POST'])
def add_user():
    if not User.validate_user(request.form):
        return jsonify(message = "Por favor revise que los datos ingresados sean correctos. Recuerde que no se aceptan campos vacios")
    
    pwd = bcrypt.generate_password_hash(request.form['password'])
    formulario = {
        "name": request.form['name'],
        "last_name" : request.form['last_name'],
        "email" : request.form['email'],
        "password" : pwd
    }
    id  = User.save(formulario)
    session['usuario_id'] = id
    
    if request.method == 'POST':
        msg = Message("¡Bienvenido a Bordo!", sender='noreply@demo.com', recipients=['yotomc17@gmail.com'])
        #msg.body = 'Hola, tu usuario se ha creado exisotamente'
        msg.html = render_template('email/welcome.html', user = request.form['name'])
        mail.send(msg)
        #return "Sent email."
    return jsonify(message = "Registro Creado Exitosamente")


@app.route('/update_user')
def update_user():
    if 'usuario_id' not in session:
        return redirect('/login_user')
    
    formulario = {
        "id": session['usuario_id']
    }
    user = User.get_by_id(formulario)
    return render_template('update_user.html', user = user)


@app.route('/update/user', methods=['POST'])
def update_users():
    if 'usuario_id' not in session:
        return redirect('/login_user')
    
    if not User.validate_user(request.form):
        return jsonify(message = "Por favor revise que los datos ingresados sean correctos. Recuerde que no se aceptan campos vacios")
    
    User.update(request.form)
    return jsonify(message = "Usuario Actualizado Correctamente")


@app.route('/admin_products')
def products():
    if 'usuario_id' not in session:
        return redirect('/login_user')
    
    formulario = {
        "id": session['usuario_id']
    }
    user = User.get_by_id(formulario)
    products = Product.get_products_by_user(formulario)
    return render_template('admin_products.html', user = user, products = products)

@app.route('/home')
def back_home():
    return redirect ('/')

@app.route('/logout')
def back_login():
    session.clear()
    return redirect ('/')