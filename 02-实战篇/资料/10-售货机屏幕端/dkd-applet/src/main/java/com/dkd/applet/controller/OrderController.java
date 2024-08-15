package com.dkd.applet.controller;

import cn.elegent.pay.dto.PayResponse;
import com.dkd.applet.domain.dto.PayDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/order")
@Slf4j
public class OrderController {

    // 支付
    @PostMapping("/requestPay/{tradeType}/{platform}")
    public PayResponse requestPay(@RequestBody PayDto payDto, @PathVariable("tradeType") String tradeType, @PathVariable("platform") String platform) {
        return null;
    }
}
