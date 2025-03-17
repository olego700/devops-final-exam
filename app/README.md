# Flask Application
This folder contains a Flask app that monitors AWS resources (EC2, VPCs, LBs, AMIs).

## Implemented
- Flask app with Boto3 to fetch AWS resources.
- Multi-stage Dockerfile for efficient image building.

## How to Run
1. SSH into the EC2 instance.
2. Clone the repo: `git clone https://github.com/olego700/devops-final-exam.git`
3. Navigate to `app/`.
4. Build the Docker image: `docker build -t flask-aws-monitor .`
5. Run the container: `docker run -d -p 5001:5001 -e AWS_ACCESS_KEY_ID=<key> -e AWS_SECRET_ACCESS_KEY=<secret> flask-aws-monitor`
6. Access at `http://<PUBLIC_IP>:5001/`.
