import json
import boto3
import io
from io import BytesIO
import sys

import math

def process_text_analysis(bucket, document):

    #Get the document from S3
    s3_connection = boto3.resource('s3')
                          
    s3_object = s3_connection.Object(bucket,document)
    s3_response = s3_object.get()

    stream = io.BytesIO(s3_response['Body'].read())
#    image=Image.open(stream)

    # Analyze the document
    client = boto3.client('textract')
    
    image_binary = stream.getvalue()
    response = client.analyze_document(Document={'Bytes': image_binary},
        FeatureTypes=["TABLES", "FORMS"])
    blocks=response['Blocks']
    return blocks

def lambda_handler(event, context):

    bucket = 'textract-manohar'
    document = 'sample.jpg'
    Blocks=process_text_analysis(bucket,document)

    #Get the text blocks
    #blocks=response['Blocks']
    
    return {
        'statusCode': 200,
        'body': json.dumps(Blocks)
    }  