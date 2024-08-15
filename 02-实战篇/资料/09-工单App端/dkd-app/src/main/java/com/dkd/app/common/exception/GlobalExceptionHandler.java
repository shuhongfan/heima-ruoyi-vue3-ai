package com.dkd.app.common.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常拦截
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
    @ResponseBody
    @ExceptionHandler(value = LogicException.class)
    public ResponseEntity<String> exceptionHandler(LogicException e){
        log.error("controller call error",e);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
    }

    @ResponseBody
    @ExceptionHandler(value = DuplicateKeyException.class)
    public ResponseEntity<String> exceptionHandler(DuplicateKeyException e){
        log.error("controller call error",e);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("已存在此名称的对象");
    }

    @ResponseBody
    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> exceptionHandler(Exception e){
        log.error("error",e);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("服务器内部错误");
    }
}
