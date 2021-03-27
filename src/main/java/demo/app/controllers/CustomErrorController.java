package demo.app.controllers;

import com.microsoft.applicationinsights.TelemetryClient;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomErrorController implements ErrorController {

  @Autowired(required = false)
  TelemetryClient telemetryClient;
  
  /**
   * Handle errors.
   * @return The named view
   */
  @GetMapping("/error")
  public String handleError(Model model, HttpServletRequest request) {
    int status = (Integer) request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
    Exception exception = (Exception) request.getAttribute("javax.servlet.error.exception");
    String message = "";
    System.out.println("### telemetryClient = " + telemetryClient);
    if (exception != null) {    
      if (telemetryClient != null) {
        telemetryClient.trackException(exception);
      }
      message = exception.getMessage();
    } else {
      message = HttpStatus.resolve(status).getReasonPhrase();
    }
    model.addAttribute("message", message);
    model.addAttribute("status", status);
    return "error";
  }

  @Override
  public String getErrorPath() {
    return "/error";
  }
}