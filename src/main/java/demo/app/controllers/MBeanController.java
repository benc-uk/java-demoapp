package demo.app.controllers;

import java.lang.management.ManagementFactory;
import java.util.*;

import javax.management.*;

//import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

//@RestController
@Controller
public class MBeanController {
    @GetMapping("/mbeans")
    public String getMetrics(Model model) throws Exception {
        HashMap<String, Object> resp = new HashMap<String, Object>();
        
        MBeanServer platmBeanServer = ManagementFactory.getPlatformMBeanServer();
        Set<ObjectName> mBeanNames = platmBeanServer.queryNames(null, null);
        
        for(ObjectName name : mBeanNames) {
            MBeanInfo info = platmBeanServer.getMBeanInfo(name);
            HashMap<String, Object> mbeanSection = new HashMap<String, Object>();
            for(MBeanAttributeInfo attr : info.getAttributes()) {
                try {
                    Object attrValue = platmBeanServer.getAttribute(ObjectName.getInstance(name.getCanonicalName()), attr.getName());
                    if(attr.getName().equalsIgnoreCase("LastGcInfo")) continue;
                    if(attr.getName().equalsIgnoreCase("ClassPath")) continue;
                    if(attr.getName().equalsIgnoreCase("SystemProperties")) continue;
                    mbeanSection.put(attr.getName(), attrValue.toString());
                } catch(Exception e) { }
            }
            //model.addAttribute(name.getCanonicalName(), mbeanSection);
            resp.put(name.getCanonicalName(), mbeanSection);
        }

        model.addAttribute("data", resp);
        return "mbeans";
    }
}