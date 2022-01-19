from faker import Faker

fake = Faker()
import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf 8'), bcrypt.gensalt(8))
    return hashed

def factory_user():
    user = {
        "name": fake.first_name(),
        "lastName": fake.last_name(),
        "email": fake.free_email(),
        "password": "pdw123"
    }
    return user


def factory_wrong_email():
    first_name = fake.first_name()
    return {
        "name": first_name,
        "lastName": fake.last_name(),
        "email": first_name.lower() + '&gmail.com',
        "password": "pdw123"
    }


def factory_user_login():
    return {
        "name": 'Horley',
        "lastName": 'Amorim',
        "email": 'horleylamorim@gmail.com',
        "password": "pdw123"
    }
