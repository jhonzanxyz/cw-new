# Python 3.12 का बेस इमेज (3.9.7 पुराना है)
FROM python:3.12-slim

# सिस्टम डिपेंडेंसीज (FFmpeg + Aria2)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    aria2 \
    && rm -rf /var/lib/apt/lists/*

# वर्किंग डायरेक्टरी सेट करें
WORKDIR /app

# सभी फाइल्स कॉपी करें
COPY . .

# Python डिपेंडेंसीज इंस्टॉल करें (एक बार ही काफी)
RUN pip install --no-cache-dir -r requirements.txt

# बॉट लॉन्च करें
CMD ["python3", "main.py"]
