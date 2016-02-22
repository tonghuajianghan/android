package adapter;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import alien.jh.activity.R;

/**
 * listView在开始绘制的时候，系统首先调用getCount()函数，
 * 根据他的返回值得到 listView的长度，然后根据这个长度，
 * 调用getView()逐一绘制每一行。如果你的 getCount()返回值是0的话
 * 则不绘制列表
 *
 * Created by jhon on 2016/1/21.
 */

public class WealthAdapter extends BaseAdapter{
    //被提供的上下文
    private Context context;
    //list_item文件路径
    private int resource;

    public WealthAdapter(Context context,int resource){
        this.context = context;
        this.resource = resource;
        Log.i("alien111111", "---------111111-------------" + Integer.toString(resource));
    }

/*
    private String[] texts = new String[]{"天气","傍晚","天空","dog"};
    private int[] images = new int[]{R.drawable.t1,R.drawable.t2,R.drawable.t3,R.drawable.t4};

*/

    /**
     * 重写父类方法
     *
     * */

    // 描述adpter的大小（确定了listView的条目）
    @Override
    public int getCount() {
        return 1;
    }

    // Adapter对于的position的数据
    @Override
    public Object getItem(int position) {
        return null;
    }

    //得到item 在adapter所对应的位置
    @Override
    public long getItemId(int position) {
        return 0;
    }

    /**
     * java.lang.UnsupportedOperationException: addView(View, LayoutParams) is not supported in AdapterView
     * 不能添加新view
     *
     *
     * @param position
     * @param convertView
     * @param parent
     * @return
     */
    @Override
    public View getView(int position,View convertView,ViewGroup parent){
        Log.i("alien","----------------------" + Integer.toString(resource));
        View item = LayoutInflater.from(context).inflate(resource,null);
        TextView textView = (TextView)item.findViewById(R.id.textView);
        ImageView imageView = (ImageView)item.findViewById(R.id.imageView);
        textView.setText("hello");
        imageView.setImageResource(R.drawable.t1);
        return item;
    }
}

