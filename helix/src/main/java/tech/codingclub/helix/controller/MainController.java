package tech.codingclub.helix.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.apache.log4j.Logger;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import tech.codingclub.helix.database.GenericDB;
import tech.codingclub.helix.entity.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;

/**
 * User: rishabh
 */
@Controller
@RequestMapping("/")
public class MainController extends BaseController {

    private static Logger logger = Logger.getLogger(MainController.class);

    @RequestMapping(method = RequestMethod.GET, value = "/helloworld")
    public String getQuiz(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "hello";
    }@RequestMapping(method = RequestMethod.GET, value = "/signup")
    public String signUp(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        return "signup";
    }@RequestMapping(method = RequestMethod.POST, value = "/signup")
    public
    @ResponseBody
    SignupResponse signUpData(@RequestBody Member member, HttpServletRequest request, HttpServletResponse response) {
        boolean user_created=false;
        String message="";
        if(GenericDB.getCount(tech.codingclub.helix.tables.Member.MEMBER,tech.codingclub.helix.tables.Member.MEMBER.EMAIL.eq(member.email))>0)
        {
            message="User already exist";
        }
        else
        {    member.role="cm";
            new GenericDB<Member>().addRow(tech.codingclub.helix.tables.Member.MEMBER,member);
            user_created=true;
            message="User created";
        }
        return new SignupResponse(message,user_created);
    }
    @RequestMapping(method = RequestMethod.GET, value = "/api/time")
    public  @ResponseBody String getTime(ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        TimeApi timeapi= new TimeApi(new Date().toString(),new Date().getTime());
        return new Gson().toJson(timeapi);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/api/wiki")
    public  @ResponseBody String getWikiResultGson(ModelMap modelMap,@RequestParam("country") String country, HttpServletResponse response, HttpServletRequest request) {
        WikiPediaFetcher x=new WikiPediaFetcher(country);
        WikiResult x2=x.getResult();return new Gson().toJson(x2);
       //eturn x.getResult();
    }
    @RequestMapping(method = RequestMethod.GET, value = "/api/wiki/html")
    public   String getWikiResultHtml(ModelMap modelMap,@RequestParam("country") String country, HttpServletResponse response, HttpServletRequest request) {
       //ikiPediaFetcher x=new WikiPediaFetcher(country);
        WikiPediaFetcher x=new WikiPediaFetcher(country);WikiResult x2=x.getResult();modelMap.addAttribute("IMAGE",x2.getUrl());
modelMap.addAttribute("DESCRIPTION",x2.getResult());return "wikiapi";}
    @RequestMapping(method = RequestMethod.POST, value = "/handle")
    public
    @ResponseBody
    String handleEncrypt(@RequestBody String data, HttpServletRequest request, HttpServletResponse response) {
        return "ok";
    }
}
