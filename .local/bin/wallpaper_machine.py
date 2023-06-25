import json 
import subprocess
import requests

api_key = ""
response = requests.get(f'https://wallhaven.cc/api/v1/search?apikey={api_key}&sorting=random')
file = response.text
data = json.loads(file)
data_json = open('search.json','w')
subprocess.Popen("dunstify 'Wallpaper' 'file almost ready..' ",shell=True)
for i in data['data']:
    print(i['path'],file=data_json)
data_json.close()
