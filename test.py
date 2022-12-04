import requests

def make_request():
    res = requests.get('https://reqres.in/api/users')

    print(res.json())


make_request()