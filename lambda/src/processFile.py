'''
Comment
'''
import boto3
import json
import os
from botocore.exceptions import ClientError

def handler(event, context):
    print('Received event: ' + json.dumps(event, indent=2))

    # Get value from env variable created by terraform
    max_lines = os.environ['MAX_LINES']
    region = os.environ['REGION']

    print('Max Lines: ' + max_lines)
    print('Region: ' + region)

    # Get bucket name from the S3 event
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    
    # Get file key from the S3 event
    file_key = event['Records'][0]['s3']['object']['key']

    print('Reading {} from {}'.format(file_key, bucket_name))

    # Get the object from S3
    s3 = boto3.client('s3', region)
    obj = s3.get_object(Bucket=bucket_name, Key=file_key)

    # Get lines inside the file
    lines = obj.get('Body').read().split(b'\n')

    # Run lines and print to logs
    for line in lines:
       print(line.decode())

    # Delete the file
    s3.delete_object(Bucket=bucket_name, Key=file_key)
    print('Bucket Deleted')