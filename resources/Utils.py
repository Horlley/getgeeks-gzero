from faker import Faker
fake = Faker()

def screenshor_name():
    return fake.sha1()
