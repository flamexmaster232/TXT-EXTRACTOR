import os
from os import getenv

API_ID = int(os.environ.get("API_ID", "26548330"))  # Replace "123456" with your actual api_id or use .env
API_HASH = os.environ.get("API_HASH", "244c3afd019c7b0cd1a8184cd2be2495")
BOT_TOKEN = os.environ.get("BOT_TOKEN", "7663652095:AAEdnuTlHTBHPZSSgQOp_ZDlQagJAK53Sng")

OWNER_ID = int(os.environ.get("OWNER_ID", "6890753169"))  # Your Telegram user ID
SUDO_USERS = list(map(int, os.environ.get("SUDO_USERS", "6890753169").split()))  # Space-separated user IDs

MONGO_URL = os.environ.get("MONGO_URL", "mongodb+srv://movieexplainer9582:oxfbfjzMuPCgbgaG@cluster0.b3hwc1l.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")##your mongo url eg: withmongodb+srv://xxxxxxx:xxxxxxx@clusterX.xxxx.mongodb.net/?retryWrites=true&w=majority
CHANNEL_ID = int(os.environ.get("CHANNEL_ID", "-1002823882872"))  # Telegram channel ID (with -100 prefix)

PREMIUM_LOGS = os.environ.get("PREMIUM_LOGS", "")  # Optional here you'll get all logs
