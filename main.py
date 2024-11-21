from flask import Flask, jsonify
import boto3
app = Flask(__name__)

AWS_ACCESS_KEY_ID = "AKIAQ3EGR5G3AGCOI75B"
AWS_SECRET_ACCESS_KEY = "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"
BUCKET_NAME = "api-bucket123"
s3 = boto3.client('s3',
                  aws_access_key_id=AWS_ACCESS_KEY_ID,
                  aws_secret_access_key=AWS_SECRET_ACCESS_KEY)

@app.route('/')
def hello():
    response = s3.list_objects_v2(Bucket=BUCKET_NAME)
    objects = []
    for obj in response['Contents']:
        objects.append(obj['Key'])
    print (obj)


    return jsonify({'content': objects})

    
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
