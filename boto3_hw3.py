import boto3
from botocore.exceptions import ClientError

# -----------------------------
# 1. LIST FILES IN S3 BUCKET
# -----------------------------
def list_s3_objects(bucket_name):
    s3 = boto3.client('s3')
    print(f"\nListing objects in bucket: {bucket_name}")

    try:
        response = s3.list_objects_v2(Bucket=bucket_name)
        if "Contents" in response:
            for obj in response["Contents"]:
                print(f" - {obj['Key']} (Size: {obj['Size']} bytes)")
        else:
            print("Bucket is empty.")
    except ClientError as e:
        print("Error:", e)


# -----------------------------
# 2. CREATE DYNAMODB TABLE
# -----------------------------
def create_dynamodb_table(table_name):
    dynamodb = boto3.resource('dynamodb')

    print(f"\nCreating DynamoDB table: {table_name}")

    try:
        table = dynamodb.create_table(
            TableName=table_name,
            KeySchema=[
                {'AttributeName': 'ID', 'KeyType': 'HASH'}  # Partition key
            ],
            AttributeDefinitions=[
                {'AttributeName': 'ID', 'AttributeType': 'S'}
            ],
            BillingMode='PAY_PER_REQUEST'
        )

        table.meta.client.get_waiter('table_exists').wait(TableName=table_name)
        print(f"Table '{table_name}' created successfully!")

        return table

    except ClientError as e:
        if e.response['Error']['Code'] == 'ResourceInUseException':
            print("Table already exists. Using existing table.")
            return dynamodb.Table(table_name)
        else:
            print("Error:", e)


# -----------------------------
# 3. INSERT ITEM INTO TABLE
# -----------------------------
def insert_item(table, item_id, payload):
    print(f"\nInserting item into table '{table.table_name}'")

    try:
        table.put_item(Item={'ID': item_id, 'Data': payload})
        print("Item inserted successfully!")
    except ClientError as e:
        print("Error:", e)


# -----------------------------
# MAIN SCRIPT
# -----------------------------
if __name__ == "__main__":
    bucket_name = "sahillab-445492532156-bucket"
    table_name = "SahilHW3Table"

    # 1. List S3 Objects
    list_s3_objects(bucket_name)

    # 2. Create DynamoDB Table
    table = create_dynamodb_table(table_name)

    # 3. Insert Item
    insert_item(table, "123", "Hello from Boto3!")
