package demo.app.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ToolsController {

    @GetMapping("/tools")
    public String getTools() {
        return "tools";
    }

    @GetMapping("/tools/error")
    public String fakeError() throws Exception {
        throw new NullPointerException("I made this exception happen, sorry!");
        //return "";
    }

    @GetMapping("/tools/cpu")
    public String cpuLoad(Model model) {
        long start = java.lang.System.currentTimeMillis();
        for(int i = 0; i < 499900000.0; i++) { 
            var val = Math.pow(9000.0, 9000.0);
        }
        long elapsed = java.lang.System.currentTimeMillis() - start;
        model.addAttribute("time", elapsed);
        return "tools";
    }
}