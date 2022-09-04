from app import app
from flask import render_template, redirect, session, request, flash, jsonify
from flask_mail import Mail, Message
from app.email import welcome_mail, send_async_mail
from app.models.products import Product
from app.models.users import User

mail = Mail(app)

@app.route('/view/product')
def explore_product():
    return render_template('view_product.html')

@app.route('/products/add')
def new_product():
    if 'usuario_id' not in session:
        return redirect('/login_user')

    formulario = {
        "id": session['usuario_id']
    }
    user = User.get_by_id(formulario)
    return render_template('add_product.html', user = user)


@app.route('/create/product', methods = ['POST'])
def create_product():
    if 'usuario_id' not in session:
        return redirect('/login_user')
    
    if not Product.validate_product(request.form):
        return jsonify(message = "Por favor revise que los datos ingresados sean correctos. Recuerde que no se aceptan campos vacios")
    
    Product.save(request.form)
    if request.method == 'POST':
        msg = Message("¡Tu producto se ha agregado!", sender='noreply@demo.com', recipients=['yotomc17@gmail.com'])
        msg.html = render_template('email/product_created.html', name_prod = request.form['name_prod'])
        mail.send(msg)
    return jsonify(message = "Producto Creado Correctamente")


@app.route('/edit/product/<int:id>')
def edit_product(id):
    if 'usuario_id' not in session:
        return redirect('/login_user')
    
    formulario = {
        "id": session['usuario_id']
    }
    formulario_product = { 
        "id": id 
    }
    product = Product.get_by_id_product(formulario_product)
    user = User.get_by_id(formulario)
    return render_template('edit_products.html', user = user, product = product)


@app.route('/update/product', methods=['POST'])
def update_product():
    if 'usuario_id' not in session:
        return redirect('/login_user')
    
    if not Product.validate_product(request.form):
        return jsonify(message = "Por favor revise que los datos ingresados sean correctos. Recuerde que no se aceptan campos vacios")
    
    Product.update(request.form)
    if request.method == 'POST':
        msg = Message("¡Tu producto se ha modificado exitosamente!", sender='noreply@demo.com', recipients=['yotomc17@gmail.com'])
        msg.html = render_template('email/edited_product.html', name_prod = request.form['name_prod'])
        mail.send(msg)
    return jsonify(message = "Producto Actualizado Correctamente")


@app.route('/delete/product/<int:id>')
def delete_product(id):
    if 'usuario_id' not in session:
        return redirect('/login_user')
    
    formulario_product = { "id": id }
    Product.delete(formulario_product)
    if request.method == 'GET':
        msg = Message("Tu producto ha sido eliminado ;-)", sender='noreply@demo.com', recipients=['yotomc17@gmail.com'])
        msg.html = render_template('email/removed_product.html')
        mail.send(msg)
    return redirect('/admin_products')
