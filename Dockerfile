FROM python:3.10.0-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000
RUN pip freeze > installed_packages.txt
RUN sed -i 's/socketio.run(app, host="0.0.0.0", port=5000, debug=True)/socketio.run(app, host="0.0.0.0", port=5000, debug=True, allow_unsafe_werkzeug=True)/' /app/restapi.py
CMD ["python", "/app/restapi.py"]
