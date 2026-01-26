
class StorageErrorModel{
  final String ?message;

  StorageErrorModel({required this.message});
}


class StorageReadFailure extends StorageErrorModel{
  StorageReadFailure({
    super.message=StoargeFailureMessage.storageReadFailure,
    });

  
}
class StorageWriteFailure extends StorageErrorModel{
  StorageWriteFailure({
    super.message=StoargeFailureMessage.storageWriteFailure,
    });
}

class StorageDeleteFailure extends StorageErrorModel{
  StorageDeleteFailure({
    super.message=StoargeFailureMessage.storageDeleteFailure,
    });
}

class StorageDeleteAllFailure extends StorageErrorModel{
  StorageDeleteAllFailure({
    super.message=StoargeFailureMessage.storageDeleteAllFailure,
    });
}
class StorageReadAllFailure extends StorageErrorModel{
  StorageReadAllFailure({
    super.message=StoargeFailureMessage.storageReadAllFailure,
    });
}
class DataNotFoundFailure extends StorageErrorModel {
   DataNotFoundFailure({
   super.message=StoargeFailureMessage.dataNotFoundFailure,
   });
}

class StoargeFailureMessage {
 
 static const String storageReadFailure='Failed to read from secure storage.';
 static const String storageWriteFailure='Failed to write to secure storage.';
 static const String storageDeleteFailure='Failed to delete from secure storage.';
 static const String storageDeleteAllFailure='Failed to delete all from secure storage.';
 static const String storageReadAllFailure='Failed to read all from secure storage.';
 static const String dataNotFoundFailure='Data not found in storage.';
 static const String keyNotFound=  'Key not found in secure storage';
 static const String  unexpectedError='An unexpected error occurred';
 static const String failedToDecrypt='Failed to encrypt payload';
 static const String noToken ='No token found';
  
}