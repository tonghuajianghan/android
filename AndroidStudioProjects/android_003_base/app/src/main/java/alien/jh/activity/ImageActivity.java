package alien.jh.activity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class ImageActivity extends AppCompatActivity {

    private final static String[] data = {"张飞","张辽","张角","张三丰","张牙舞爪","张灯结彩","张唑啉","张大民"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_image);

        //簡單列表
        ListView listView = (ListView)findViewById(R.id.listView);
        ArrayAdapter<String> adapter1 = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1,data);
        listView.setAdapter(adapter1);
    }
}
