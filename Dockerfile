FROM python:3.13

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

# Beri default PORT, Heroku akan override saat runtime
ENV PORT=8000
EXPOSE 8000

# Gunakan shell form agar $PORT di-expand pada runtime (Heroku sets PORT env)
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app