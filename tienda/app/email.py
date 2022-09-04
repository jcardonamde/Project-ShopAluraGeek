from flask_mail import Message, Mail
from flask import current_app, render_template
from . import mail, app
from threading import Thread

def send_async_mail(message):
    with app.app_context():
        mail.send(message)

def welcome_mail(user):
    #message = Message('Bienvenido a Alura Geek Shop', sender=current_app.config['MAIL_USERNAME'], recipients=[user.email])
    message = Message('Producto creado Exitosamente', sender=current_app.config['MAIL_USERNAME'], recipients=['yotomc17@gmail.com'])
    message.html = render_template('email/product_ok.html', user=user)
    thread = Thread(target = send_async_mail, args=[message])
    thread.start()