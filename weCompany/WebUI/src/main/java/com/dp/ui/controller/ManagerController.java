package com.dp.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dp on 14-10-16.
 */
@Controller
@RequestMapping("mg")
public class ManagerController {

    @RequestMapping("/")
    public String index(){
        return "/manager/index";
    }
}
