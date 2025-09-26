import boto3
s3 = boto3.client('s3')
bucket_name = 'my-boto3-s3-bucket-shahi1509'
file_name = 'myfile.txt'

s3.delete_object(Bucket=bucket_name, Key=file_name)
print(f'File {file_name} deleted successfully!')
