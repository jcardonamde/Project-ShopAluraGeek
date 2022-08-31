from decouple import config

class Config:
    pass

class DevelopmentConfig(Config):
    DEBUG = True
    
    MAIL_SERVER = 'smtp.googlemail.com'
    MAIL_PORT = 587
    MAIL_USE_TLS = True
    MAIL_USERNAME = 'yotomc17@gmail.com'
    MAIL_PASSWORD = 'password' #config('MAIL_PASSWORD') #OS
    
config = {
    'development': DevelopmentConfig,
    'default': DevelopmentConfig    
}
