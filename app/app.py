import os
import boto3
from flask import Flask, render_template_string

app = Flask(__name__)

# Fetch AWS credentials from environment variables
AWS_ACCESS_KEY = os.getenv("AWS_ACCESS_KEY_ID")
AWS_SECRET_KEY = os.getenv("AWS_SECRET_ACCESS_KEY")
REGION = "us-east-1"

# Initialize Boto3 clients
session = boto3.Session(
    aws_access_key_id=AWS_ACCESS_KEY,
    aws_secret_access_key=AWS_SECRET_KEY,
    region_name=REGION
)
ec2_client = session.client("ec2")
elb_client = session.client("elbv2")

@app.route("/")
def home():
    # Fetch EC2 instances
    instances = ec2_client.describe_instances()
    instance_data = []
    fo
