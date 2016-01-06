package com.example.android_001;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //加载activity_main.xml文件
        setContentView(R.layout.activity_main);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
    
    public void test(View view){
    	//获取文本框，并改变其中的内容，R类可以监控到所有的资源
    	TextView textView = (TextView)findViewById(R.id.textView1);
    	textView.setText("ccc");
    	//类中引用资源文件中的内容
    	textView.setText(R.string.msg);
    	
    	//输出
    	Toast.makeText(MainActivity.this, "点击了button", Toast.LENGTH_SHORT).show();
    }
}
