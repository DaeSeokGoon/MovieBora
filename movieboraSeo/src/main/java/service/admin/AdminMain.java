package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service1.CommandProcess;

public class AdminMain implements CommandProcess {


	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		return "adminMain";
	}

}
