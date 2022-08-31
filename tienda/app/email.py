from flask_mail import Message, Mail
from flask import current_app, render_template
from . import mail, app
from threading import Thread

def send_async_mail(message):
    with app.app_context():
        mail.send(message)

def welcome_mail(user):
    message = Message('Bienvenido a el proyecto de Jonathan Cardona Bootcamp Coding Dojo', sender=current_app.config['MAIL_USERNAME'], recipients=[user.email])
    message.html = render_template('email/welcome.html', user=user)
    thread = Thread(target = send_async_mail, args=[message])
    thread.start()