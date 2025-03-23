from flask import Flask, session
from flask_mail import Mail

app = Flask(__name__)
app.secret_key = "config_your_secret_key"

mail = Mail()

def create_app(config):
    app.config.from_object(config)
    mail.init_app(app)
    with app.app_context():
        pass

    return app
