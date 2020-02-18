package com.liujiajun;

import com.liujiajun.controller.ProductController;
import com.liujiajun.domain.Permission;
import com.liujiajun.service.IPermissionService;
import com.liujiajun.service.impl.ProductServiceImpl;
import org.junit.Test;

import java.lang.reflect.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class test {

    @Test
    public void test1() throws ClassNotFoundException, NoSuchMethodException, IllegalAccessException, InstantiationException, InvocationTargetException, NoSuchFieldException {
        Class<?> aClass = Class.forName("com.liujiajun.controller.ProductController");
        String name = aClass.getName();
        System.out.println(name);
        Field[] fields = aClass.getDeclaredFields();
        for (Field field : fields) {
            System.out.println(field);
        }

        Method findAll = aClass.getMethod("findAll", Integer.class, Integer.class);
//        System.out.println(findAll);
        ProductController o = (ProductController) aClass.newInstance();
//        findAll.invoke(o,12,12);

    }


    @Test
    public void test2(){
        IPermissionService proxy = (IPermissionService) Proxy.newProxyInstance(ProductServiceImpl.class.getClassLoader(),
            ProductServiceImpl.class.getInterfaces(), new InvocationHandler() {

            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                return null;
            }


        });

        Permission byId = proxy.findById("12");
    }

    @Test
    public  void test3(){

        String s1=new String("2");
        String s2=new String("2");
        System.out.println(s1.hashCode());
        System.out.println(s2.hashCode());
        System.out.println(s1==s2);
        System.out.println(s1.equals(s2));
    }

    @Test
    public void test4(){
        Map<String,String> map=new HashMap<>();
        map.put("张三","zs");
        map.put("李四","ls");
        map.put("王五","ww");

        for (String s : map.keySet()) {
            System.out.println(s+":"+map.get(s));
        }

        for (Map.Entry<String, String> entry : map.entrySet()) {
            System.out.println(entry.getKey()+":"+entry.getValue());
        }

    }

    @Test
    public void test5(){

        ArrayList<Integer> list = new ArrayList<>();
        Collections.addAll(list,2,1,3);
        System.out.println(list);

        Collections.reverse(list);
        System.out.println(list);

        Collections.sort(list);
        System.out.println(list);

        Collections.shuffle(list);
        System.out.println("随机排序"+list);
    }


    @Test
    public void test6(){
//        Integer a = Integer.valueOf("a");
//        System.out.println(a);

        char[] a=new char[3];
        a[0]='a';
        a[1]='b';
        a[2]='c';

        String s = String.valueOf(a);
        System.out.println(s);

        String s1 = String.valueOf(2.3);
        System.out.println(s1);

        int i = Integer.parseInt("12");
        System.out.println(i);
    }


    @Test
    public void test7(){

        new Thread(){
            @Override
            public void run() {
                for (int i = 0; i < 100; i++) {
                    System.out.println("哈哈"+i);
                }
            }
        }.start();


        for (int i = 0; i < 10000; i++) {
            System.out.println(i);

        }

    }


    @Test
    public void test8(){

        //随机整数 1-100
//      Math.random() 会生成[0,1)的随机数
        int random = (int)(Math.random() * 100)+1;
//        System.out.println(random);


        Random random2=new Random();
//      会随机生成一个整数，这个整数的范围就是int类型的范围-2^31 ~ 2^31-1,
//      但是如果在nextInt()括号中加入一个整数a，那么，这个随机生成的随机数范围就变成[0,a)。
        int x = random2.nextInt(100)+1;
//        System.out.println(x);


        for (int i = 0; i < 1000; i++) {
            long l = System.currentTimeMillis();
//            System.out.println(l);
        }

//        返回当前的计算机时间，时间的表达格式为当前计算机时间和1970年1月1号0时0分0秒所差的毫秒数。
        long currentTime = System.currentTimeMillis();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy年-MM月dd日-HH时mm分ss秒");
        Date date = new Date(currentTime);
        System.out.println(formatter.format(date));

    }


    @Test
    public void test9(){

        LinkedList<String> list=new LinkedList<String>();
        long start = System.currentTimeMillis();
        for (int i = 0; i < 10000000; i++) {
            list.add("he");
        }
        long end = System.currentTimeMillis();
        System.out.println("LinkedList新增1000条数据耗时："+(end-start));


        ArrayList<String> list2=new ArrayList<>();
        long start2 = System.currentTimeMillis();
        for (int i = 0; i < 10000000; i++) {
            list2.add("he");
        }
        long end2 = System.currentTimeMillis();
        System.out.println("ArrayList新增1000条数据耗时："+(end2-start2));


    }


    @Test
    public void test10(){
        HashMap<String, String> hashMap = new HashMap<>();
        hashMap.put("AA","BB");
        hashMap.put(null,"DD");
        hashMap.put("EE",null);
        for (String s : hashMap.keySet()) {
            System.out.println(s+":"+hashMap.get(s));
        }

        Hashtable<String,String> hashtable=new Hashtable();
        hashtable.put("11","22");
        hashtable.put("00","33");
        for (String key : hashtable.keySet()) {
            System.out.println(key+":"+hashtable.get(key));
        }

    }


    @Test
    public void test11(){
        //int -> String
        int a=100;
        String s = String.valueOf(a);
        System.out.println(s);

        //String -> int
        String s1="333";
        int i = Integer.parseInt(s1);
        System.out.println(i);

        // 字符串转换成数组
        String s4="13579";
        char[] chars = s4.toCharArray();
        for (char aChar : chars) {
            System.out.println(aChar);
        }
        System.out.println("---------------------");

        //数组转换成字符串
        String s5 = String.valueOf(chars);
        System.out.println(s5);

        Float f = 1.44f;
        Double d = 1.66;
    }

    @Test
    public void test12(){
        String[] s1=new String[10];
        int length = s1.length;
        String s2="hahha";
        int length1 = s2.length();

    }


    @Test
    public void test13(){
        String a="x";
        String b=new String("x");
        System.out.println(a==b);
        System.out.println(a.equals(b));
        System.out.println(a.hashCode()==b.hashCode());

    }

    @Test
    public void test14(){
        String s1="a"+"c";
        String s2=new String(s1);
        if(s2=="ac")
            System.out.println("==");
        if(s1.equals(s2))
            System.out.println("edd");
    }

    @Test
    public void test15(){

        int[] array = new int[5];
        array[0]=30;
        array[1]=10;
        array[2]=40;
        array[3]=32;
        array[4]=170;

       for (int i = 0; i < array.length; i++)
             for (int j = 0; j < array.length - 1 - i; j++)
                   if (array[j + 1] < array[j]) {
                      int temp = array[j + 1];
                    array[j + 1] = array[j];
                       array[j] = temp;
                  }

        for (int i : array) {
            System.out.println(i);
        }

    }



    @Test
    //冒泡排序
    public void test17(){
        int[] arr={1,6,4,7,9,2,-33,-11};
        for(int i=0;i<arr.length-1;i++){
            for(int j=0;j<arr.length-1-i;j++){
                if(arr[j]>arr[j+1]){
                    int x=arr[j];
                    arr[j]=arr[j+1];
                    arr[j+1]=x;
                }
            }
        }
        for (int i : arr) {
            System.out.println(i);
        }
    }

    //选择排序
    @Test
    public void test20(){
        int[] arr={1,3,77,2,55,-3,5,-44};
        //最后一个数字没有后面的数字
        for (int i = 0; i < arr.length-1; i++) {
            int min = i;  //还没和后面的元素比较时，当前元素是最小的
            //和后面的元素比较，所以是i+1开始
            for (int j = i+1; j < arr.length; j++) {
                if(arr[min]>arr[j]){
                    min=j;
                }
            }
            //和最小的元素交换位置
            int x=arr[i];
            arr[i]=arr[min];
            arr[min]=x;
        }

        for (int i : arr) {
            System.out.println(i);
        }
    }

    @Test
    //插入排序
    public void test18(){
        int[] arr={1,-6,4,5,9,3,-33,44};
        for(int index = 1; index<arr.length; index++){//外层向右的index，即作为比较对象的数据的index
            int temp = arr[index];//用作比较的数据
            int leftindex = index-1;
            while(leftindex>=0 && arr[leftindex]>temp){//当比到最左边或者遇到比temp小的数据时，结束循环
                arr[leftindex+1] = arr[leftindex];
                leftindex--;
            }
            arr[leftindex+1] = temp;//把temp放到空位上
        }

        for (int i : arr) {
            System.out.println(i);
        }
    }




    //计算阶乘
    private static long jiecheng(int i) {
        if(i==1){
            return i;
        }
        return i*jiecheng(i-1);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入一个整数计算阶乘：");
        int i = sc.nextInt();
        while(i>=1){
            long jiecheng = jiecheng(i);
            System.out.println(i+"的阶乘为："+jiecheng);
            System.out.println("请再输入一个整数计算阶乘：");
            i = sc.nextInt();
        }
    }


}
