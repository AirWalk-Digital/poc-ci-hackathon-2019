import boto3
from boto3.session import Session
import argparse
import sys


def verify_ec2_status():
    clients = session.client('ec2')
    custom_filter = [{
        'Name': 'tag:Name',
        'Values': ['web-instance']}]

    response = clients.describe_instances(Filters=custom_filter)
    if response['Reservations'][0]['Instances'][0]['State']['Name'] == 'running':
        return False
    else:
        return True


parser = argparse.ArgumentParser(description='post deployment check')
requiredNamed = parser.add_argument_group('Required Arguments')
requiredNamed.add_argument('--access_key', help="example: access_key=dkjabnsdkjabsdkjba", required=True)
requiredNamed.add_argument('--secret_key', help="example: secret_key=bdskjdkdkadnkjadnkjandkjasnd", required=True)
args = parser.parse_args()
if __name__ == "__main__":
    session = Session(aws_access_key_id=args.access_key, aws_secret_access_key=args.secret_key)
    if verify_ec2_status():
        sys.exit(0)
    else:
        sys.exit(1)
