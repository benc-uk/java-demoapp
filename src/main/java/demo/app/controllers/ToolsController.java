package demo.app.controllers;

import java.io.FileNotFoundException;
import java.net.MalformedURLException;
import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public final class ToolsController {
  /**
   * CheckStyle forced me to add all these comments.
   * @return Who cares
   */
  static final int MAX_ERR = 6;

  /**
   * Tools page.
   * @return The named view
   */
  @GetMapping("/tools")
  public String getTools() {
    return "tools";
  }

  /**
   * Force a fake error page.
   * @return The named view
   */
  @GetMapping("/tools/error")
  public String fakeError() throws Exception {
    int randNum = (int) Math.floor(Math.random() * MAX_ERR);

    switch (randNum) {
      case 0:
        throw new NullPointerException(
                "Oh that thing you liked? It's gone"
              );
      case 1:
        throw new MalformedURLException(
                "URL has too many gerbils"
              );
      case 2:
        throw new ArrayIndexOutOfBoundsException(
                "Wow I thought that array was bigger"
              );
      case 3:
        throw new SQLException(
                "Permission denied for table LEMON_CURD"
              );
      case 4:
        throw new StackOverflowError(
                "Stack overflow! I mean it, a real one, not the website"
              );
      default:
        throw new FileNotFoundException(
                "File unexpectedly turned into cheese"
              );
    }
  }

  /**
   * Force a CPU load spike.
   * @param model something
   * @return The named view
   */
  @GetMapping("/tools/cpu")
  public String cpuLoad(final Model model) {
    long start = java.lang.System.currentTimeMillis();
    for (int i = 0; i < 499900000.0; i++) {
      Math.pow(9000.0, 9000.0);
    }
    long elapsed = java.lang.System.currentTimeMillis() - start;

    model.addAttribute("time", elapsed);
    return "tools";
  }
}
