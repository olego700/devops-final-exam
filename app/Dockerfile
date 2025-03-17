# build 
FROM python:3.10-slim AS builder

WORKDIR /app

# copy and install dependncies
COPY requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt

# copy the app.py code
COPY app.py ./


FROM python:3.10-slim

WORKDIR /app

# copy and install from build stage
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /app/app.py ./

# expose 5001 for the app
EXPOSE 5001



# Run the application
CMD ["python", "app.py"]
