AWS_CONFIG = YAML.load_file("#{Rails.root}/config/s3.yml")[Rails.env]

AWS.config(access_key_id:     AWS_CONFIG['access_key_id'],
           secret_access_key: AWS_CONFIG['secret_access_key'],
           region: AWS_CONFIG['region'])

S3_BUCKET = AWS::S3.new(:s3_signature_version => :v4).buckets[AWS_CONFIG['bucket']]