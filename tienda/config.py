from decouple import config #Se usa para leer variables entorno ver ejpl line 12

class Config:
    pass

class DevelopmentConfig(Config):
    DEBUG = True
    
    MAIL_SERVER = 'smtp.googlemail.com'
    MAIL_PORT = 587
    MAIL_USERNAME = 'holamundo.dev@pruebas.com'
    MAIL_PASSWORD = 'your_email_password' #config('MAIL_PASSWORD')  #os.environ.get('PASSWORD') --> Importando libreria OS
    MAIL_USE_TLS = True
    MAIL_USE_SSL = False
    
config = {
    'development': DevelopmentConfig,
    'default': DevelopmentConfig    
}
