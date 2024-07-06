import boto3
import os
from datetime import datetime, timezone

def generate_file(file_name):
    content = (
        "This file was generated by a Python application and was put in the bucket using boto3. "
        "The request was made from a Kubernetes pod with appropriate IAM roles and policies. "
        f"Timestamp: {datetime.now(timezone.utc).isoformat()}.\n"
    )
    with open(file_name, 'w') as file:
        file.write(content)
    print(f"File {file_name} generated.")

def upload_file_to_s3(file_name, bucket, object_name=None):
    s3_client = boto3.client('s3')
    try:
        s3_client.upload_file(file_name, bucket, object_name or file_name)
        print(f"File {file_name} uploaded to {bucket}.")
    except Exception as e:
        print(f"Error uploading file: {e}")

if __name__ == "__main__":
    file_name = "from-pod-to-s3.txt"
    bucket_name = "pod-to-s3-bucket26121996"

    generate_file(file_name)
    upload_file_to_s3(file_name, bucket_name)

    # Optionally, clean up the generated file
    os.remove(file_name)
    print(f"File {file_name} removed locally.")
