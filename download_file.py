import boto3

s3 = boto3.client('s3')
bucket_name = 'my-boto3-s3-bucket-shahi1509'
file_name = 'myfile.txt'
download_name = 'downloaded-file.txt'

s3.download_file(bucket_name, file_name, download_name)
print(f'File {file_name} downloaded successfully as {download_name}!')
