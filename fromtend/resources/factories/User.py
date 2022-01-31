from faker import Faker

fake = Faker()
import bcrypt


def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf 8'), bcrypt.gensalt(8))
    return hashed

def factory_to_insert_DB():
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek')
    ]


def factory_user(target):
    data = {
        'faker': {
            "name": fake.first_name(),
            "lastName": fake.last_name(),
            "email": fake.free_email(),
            "password": "pdw123"
        },
        'wrong_email': {
            "name": 'Pedro',
            "lastName": 'De Lara',
            "email": 'pedro_dl&hotmail.com',
            "password": "abc123"
        },
        'login': {
            "name": 'Horley',
            "lastName": 'Amorim',
            "email": 'horleylamorim@gmail.com',
            "password": "pdw123"
        },
        'be_geek': {
            'name': 'Kim',
            'lastName': 'Dotcon',
            'email': 'kim@dot.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '11999999999',
                'desc': "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.",
                'printer_repair': "Sim",
                'work': 'Remoto',
                'cost': '120'
            }
        },
        'attempt_be_geek': {
            'name': 'Wallce',
            'lastName': 'Vick',
            'email': 'vicck@yahoo.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '99999999999',
                'desc': "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.",
                'printer_repair': "Sim",
                'work': 'Remoto',
                'cost': '220'
            }
        }

    }

    return data[target]
