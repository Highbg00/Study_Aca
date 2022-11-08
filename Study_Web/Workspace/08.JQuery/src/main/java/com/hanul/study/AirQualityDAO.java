package com.hanul.study;

import java.net.MalformedURLException;
import java.net.URL;

import net.htmlparser.jericho.Source;

public class AirQualityDAO {

	public String makeJson() {
		String json ="";
		String serviceKey = "Ue5XH9sGe0OcAhYy3KyGR%2FsMCvDGzwOybGejFOs68l8M8xENec1mC08bAohGf3OGD%2BXq7ydaTajqWY7acPN6qw%3D%3D";
		String addr = "http://apis.data.go.kr/B552584/UlfptcaAlarmInqireSvc/getUlfptcaAlarmInfo?year=2020&pageNo=1&numOfRows=100&returnType=json&serviceKey=" + serviceKey;
		try {
			URL url = new URL(addr);
			Source source = new Source(url);
			json += source.toString();			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
}
