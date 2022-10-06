package com.example.social_media;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.embedding.android.FlutterActivity;
import android.provider.*;
import android.database.*;
import android.widget.*;
import java.io.*;
import java.util.*;
import android.graphics.*;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "platformChannel";
    
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
  super.configureFlutterEngine(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
        .setMethodCallHandler(
          (call, result) -> {
            // This method is invoked on the main thread.
            if(call.method.equals("getRecentImages")){
                int count=call.argument("count");
                ArrayList<String> images=listRecentImages(count);
                if(images!=null){
                    result.success(images);
                }else{
                    result.error("UNAVAILABLE", "listing failed", null);
                }                   
            }
             else {
              result.notImplemented();
            }
          }
        );
  }
  ArrayList<String> listRecentImages(int count){
    String[] projection = new String[]{
        MediaStore.Images.ImageColumns._ID,
        MediaStore.Images.ImageColumns.DATA,
        MediaStore.Images.ImageColumns.BUCKET_DISPLAY_NAME,
        MediaStore.Images.ImageColumns.DATE_TAKEN,
        MediaStore.Images.ImageColumns.MIME_TYPE
    };
    final Cursor cursor = getApplicationContext().getContentResolver()
        .query(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, projection, null, 
               null, MediaStore.Images.ImageColumns.DATE_TAKEN + " DESC");
              ArrayList<String> files=new ArrayList<String>();
  int limit=count;
  while(cursor.moveToNext()&&limit>0){
      String imageLocation = cursor.getString(1);
      files.add(imageLocation);
      limit--;
  }
    
    return files;
}
   
           
}

