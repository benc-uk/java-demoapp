package demo.app.controllers;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.SQLException;

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
        int randNum = (int)Math.floor(Math.random() * 6);

        switch(randNum) {
            case 0: throw new NullPointerException("Oh that thing you liked? It's gone");
            case 1: throw new MalformedURLException("URL has too many gerbils");
            case 2: throw new ArrayIndexOutOfBoundsException("Wow I thought that array was bigger");
            case 3: throw new SQLException("Permission denied for table LEMON_CURD");
            case 4: throw new StackOverflowError("Stack overflow! I mean it, a real one, not the website");
            default: throw new FileNotFoundException("File unexpectedly turned into cheese");
        }  
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