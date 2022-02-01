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
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_common'),
        factory_user('searcher')
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
        },
        'searcher': {
            'name': 'Johnny',
            'lastName': 'Lawrence',
            'email': 'johnnyk@cobrakai.com',
            'password': 'pwd123'
        },
        'search_alien': {
            'name': 'Dok',
            'lastName': 'Ock',
            'email': 'dok@oscorp.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '21999991001',
                'desc': 'Faço conserto de qualquer impressora. Matricial a fita, Matricial a fita colorida, a laser, a jato de tinta e também impressora 3D.',
                'printer_repair': 'Sim',
                'work': 'Presencial',
                'cost': '250'
            }
        },
        'search_common': {
            'name': 'Peter',
            'lastName': 'Parker',
            'email': 'parker@oscorp.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '21999991045',
                'desc': 'Faço instalações de distribuição Linux no seu computador PC X86 ou X64 com processador Intel ou AMF. Pode ser Linux Debian, Ubuntu, Mint, Fedora, etc...',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '200'
            }
        }
    }

    return data[target]
