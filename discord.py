# a script that sends a discord webhook request to a channel\

import requests
import json

# webhook url
url = "https://discord.com/api/webhooks/1047563608797741186/FS14pvxn58kFcacEYjilBTsRSYIy0KSp2J-Tgh2Xt3JB-IQj3I5rNuFYY89hXNbnv7Xx"

# message to send
message = "Hello World!"

# send the request
requests.post(url, data = json.dumps({
    "content": message,
    "username": "webhookbot",
    "avatar_url": "https://cdn.discordapp.com/embed/avatars/0.png",
    "tts": False
}))

