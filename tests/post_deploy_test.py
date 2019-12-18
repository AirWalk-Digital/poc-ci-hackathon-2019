import boto3
from boto3.session import Session
import argparse
import sys


def verify_ec2_status(instance_id):
    clients = session.client('ec2')

    response = clients.describe_instances(InstanceIds=[instance_id])
    if response['Reservations'][0]['Instances'][0]['State']['Name'] == 'running':
        return True
    else:
        return False


parser = argparse.ArgumentParser(description='post deployment check')
requiredNamed = parser.add_argument_group('Required Arguments')
requiredNamed.add_argument('--access_key', help="example: access_key=dkjabnsdkjabsdkjba", required=True)
requiredNamed.add_argument('--secret_key', help="example: secret_key=bdskjdkdkadnkjadnkjandkjasnd", required=True)
requiredNamed.add_argument('--instance_id', help="example: instance_id=i-0ds9f9sf9", required=True)
args = parser.parse_args()
if __name__ == "__main__":
    session = Session(aws_access_key_id=args.access_key, aws_secret_access_key=args.secret_key)
    if verify_ec2_status(args.instance_id):
        sys.exit(0)
    else:
        sys.exit(1)
