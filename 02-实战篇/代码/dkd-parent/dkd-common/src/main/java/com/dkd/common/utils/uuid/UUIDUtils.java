package com.dkd.common.utils.uuid;

import java.util.UUID;

public class UUIDUtils {
    //字符库
    public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f",
            "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
            "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",
            "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
            "W", "X", "Y", "Z" };

    /**
     * 生成一个简短的UUID字符串。
     * 该方法通过调用Java的UUID.randomUUID()生成一个标准的UUID字符串，然后对其进行处理，
     * 将其转换为一个更简短的8位字符字符串。这个过程中，使用了特定的算法将UUID的各个部分映射到特定的字符上。
     *
     * @return 返回一个8位的字符字符串，作为简短的UUID表示。
     */
    public static String getUUID() {
        // 生成一个标准的UUID字符串，并移除其中的连字符
        String uuid= UUID.randomUUID().toString().replace("-", "");
        StringBuffer shortBuffer = new StringBuffer();

        // 将UUID字符串分为8组进行处理
        for (int i = 0; i < 8; i++) {
            // 每组处理4个字符
            String str = uuid.substring(i * 4, i * 4 + 4);
            // 将当前组的4个字符转换为16进制整数
            int x = Integer.parseInt(str, 16);
            // 使用该整数对预定义的字符集取模，并将结果字符添加到短UUID字符串中
            shortBuffer.append(chars[x % 0x3E]);
        }
        // 返回处理后的8位字符UUID字符串
        return shortBuffer.toString();
    }



    /**
     * 生成售货机的clientId
     * @param innerCode
     * @return
     */
    public static String generateClientId(String innerCode){
        String clientId = System.currentTimeMillis()+innerCode;
        return org.springframework.util.DigestUtils.md5DigestAsHex(clientId.getBytes());
    }


}
