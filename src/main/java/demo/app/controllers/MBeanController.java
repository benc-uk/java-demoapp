package demo.app.controllers;

import java.lang.management.ManagementFactory;
import java.util.HashMap;
import java.util.Set;
import javax.management.MBeanAttributeInfo;
import javax.management.MBeanInfo;
import javax.management.MBeanServer;
import javax.management.ObjectName;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MBeanController {

  /**
   * Display system info.
   * 
   * @return The named view
   */
  @GetMapping("/mbeans")
   public String getMetrics(Model model) throws Exception {
    HashMap<String, Object> resp = new HashMap<String, Object>();

    MBeanServer platmBeanServer = ManagementFactory.getPlatformMBeanServer();
    Set<ObjectName> mbeanNames = platmBeanServer.queryNames(null, null);

    for (ObjectName name : mbeanNames) {
      MBeanInfo info = platmBeanServer.getMBeanInfo(name);
      HashMap<String, Object> mbeanSection = new HashMap<String, Object>();
      for (MBeanAttributeInfo attr : info.getAttributes()) {
        try {
          if (attr.getName().equalsIgnoreCase("LastGcInfo")) {
            continue;
          }
          if (attr.getName().equalsIgnoreCase("ClassPath")) {
            continue;
          }
          if (attr.getName().equalsIgnoreCase("SystemProperties")) {
            continue;
          }
          Object attrValue = platmBeanServer.getAttribute(ObjectName.getInstance(name.getCanonicalName()),
              attr.getName());
          mbeanSection.put(attr.getName(), attrValue.toString());
        } catch (Exception e) {
          continue;
        }
      }
      // model.addAttribute(name.getCanonicalName(), mbeanSection);
      resp.put(name.getCanonicalName(), mbeanSection);
    }

    model.addAttribute("data", resp);
    return "mbeans";
  }
}