package com.yanda.controller.platform;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("platform")
public class PlatformAccController {

	@RequestMapping("accPage")
	public String accPage() {
		return "platform/accPage";
	}
}
