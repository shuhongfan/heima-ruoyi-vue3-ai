package com.dkd.applet.common.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.*;

import java.io.IOException;
import java.util.Map;

public class JsonUtil {
    /**
     * 从json字符串中根据nodeName获取值
     * @param nodeName
     * @param json
     * @return
     * @throws IOException
     */
    public static String getValueByNodeName(String nodeName, String json) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(json);
        JsonNode node = jsonNode.findPath(nodeName);
        if(node == null) return null;

        return node.asText();
    }

    /**
     * 根据nodeName获取节点内容
     * @param nodeName
     * @param json
     * @return
     * @throws IOException
     */
    public static JsonNode getNodeByName(String nodeName, String json) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.readTree(json).findPath(nodeName);
    }

    /**
     * 反序列化
     * @param json
     * @param clazz
     * @param <T>
     * @return
     * @throws IOException
     */
    public static <T> T getByJson(String json, Class<T> clazz) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        // 在反序列化时忽略在 json 中存在但 Java 对象不存在的属性
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        // 在序列化时日期格式默认为 yyyy-MM-dd'T'HH:mm:ss.SSSZ
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);

        return mapper.readValue(json, clazz);
    }

    /**
     * 反序列化（驼峰转换）
     * @param json
     * @param clazz
     * @param <T>
     * @return
     * @throws IOException
     */
    public static <T> T getByJsonSNAKE(String json, Class<T> clazz) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        // 在反序列化时忽略在 json 中存在但 Java 对象不存在的属性
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        // 在序列化时日期格式默认为 yyyy-MM-dd'T'HH:mm:ss.SSSZ
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        // 设置驼峰和下划线之间的映射
        mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
        return mapper.readValue(json, clazz);
    }


    /**
     * 序列化
     * @param object
     * @return
     * @throws JsonProcessingException
     */
    public static String serialize(Object object) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();

        return mapper.writeValueAsString(object);
    }


    /**
     * 序列化（驼峰转换）
     * @param object
     * @return
     * @throws JsonProcessingException
     */
    public static String serializeSNAKE(Object object) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        // 设置驼峰和下划线之间的映射
        mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
        return mapper.writeValueAsString(object);
    }


    public static JsonNode getTreeNode(String json) throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();

        return objectMapper.readTree(json);
    }


    /**
     * 将对象转map
     * @param obj
     * @return
     * @throws IOException
     */
    public static Map<String,Object> convertToMap(Object obj) throws IOException {
        ObjectMapper mapper = new ObjectMapper();

        return mapper.readValue(serialize(obj),Map.class);
    }
}
