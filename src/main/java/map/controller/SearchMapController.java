package map.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import map.spring.IllMapService;


@Controller 
public class SearchMapController {
	private IllMapService illMapService;


	public void setIllMapService(IllMapService illMapService) {
		this.illMapService = illMapService;
	}
	
	
	
	@RequestMapping("/map")
	public String map() {
		return "map/searchMap";
	}
	
	

	//이 요청은  마커를 찍기위한 경로
	@RequestMapping(value="/map1", produces = "text/json; charset=utf-8")
	@ResponseBody
	public String getMaker(@RequestBody String message) {
		String guin = "1.1";
		String data = "";
		if (message.equals("2.2")) {
			 data = illMapService.getMaker(message);
		} else {
			data = illMapService.getMaker(guin);
		}
	
		return data;
	}
	
	


	
	//이 요청은  리스트를 만들기 위한 준비
		@RequestMapping(value="/map2", produces = "text/json; charset=utf-8")
		@ResponseBody
		public String getListItem(@RequestBody String lldata) throws ParseException {
			System.out.println("뷰에서 제이슨도착" + lldata);

			String data = illMapService.getListItem(lldata);
			
			return data;
			
		}
		
		//IP 웹요청해서 얻기
		@RequestMapping(value="/getip", produces = "text/json; charset=utf-8")
		@ResponseBody
		public String getIp() throws UnsupportedEncodingException, IOException, ParseException {
			String ipJson = new JsonIpClient().sendGet(); 
			return ipJson;
		}	
		
		
		class JsonIpClient {
		    
		    private static final String USER_AGENT = "Mozila/5.0";
		    private static final String GET_URL = "http://jsonip.com/";

		    public String sendGet() throws ClientProtocolException, IOException {
		        
		        //http client 생성
		        CloseableHttpClient httpClient = HttpClients.createDefault();
		        
		        //get 메서드와 URL 설정
		        HttpGet httpGet = new HttpGet(GET_URL);
		        
		        //agent 정보 설정
		        httpGet.addHeader("User-Agent", USER_AGENT);
		        httpGet.addHeader("Content-type", "application/json");
		        
		        //get 요청
		        CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
		        
		        System.out.println("GET Response Status");
		        System.out.println(httpResponse.getStatusLine().getStatusCode());
		        String json = EntityUtils.toString(httpResponse.getEntity(), "UTF-8");
		        
		        System.out.println("이거:" + json);
		        
		        httpClient.close();
		        return json;
		    }
		}

}
