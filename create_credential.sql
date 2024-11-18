-- CreateCredential.sql
-- Allows access from database to object storage

-- User must be granted EXECUTE on DBMS.CLOUD 

DEFINE username = 'username';
DEFINE token = 'token';

-- uri format https://objectstorage.us-ashburn-1.oraclecloud.com/n/<namespace>/b/<bucket_name>/o/
DEFINE uri = 'uri_bucket'

BEGIN
  DBMS_CLOUD.CREATE_CREDENTIAL(
    credential_name => 'OBJECT_STORAGE',
    username        => '&token',
    password        => '&token'
  );
END;
/

SELECT * FROM DBMS_CLOUD.LIST_OBJECTS('OBJECT_STORAGE', 
    '&uri_bucket');


