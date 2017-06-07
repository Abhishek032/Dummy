package com.grails

import facebook4j.Facebook
import facebook4j.FacebookException
import facebook4j.FacebookFactory
import facebook4j.PostUpdate
import facebook4j.auth.AccessToken
import java.io.*;
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class PostController {

    def postaction() {
        println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
        def message = params.campaignmessage
        def imageaddress = params.campaignphoto
        println("!!!!!!!!!!!!!!!!!"+imageaddress)
        println("message : "+message)
        Facebook facebook = (Facebook)session.getAttribute("facebook")
        //facebook.postStatusMessage(message)
        PostUpdate post = new PostUpdate(new URL("images.jpg"));
        //PostUpdate post = new PostUpdate(new URL(""));




        /*try {
            FileInputStream fis = new FileInputStream(new File("E:\\Utilities/image.jpg"));

            def mhsr = request.get(campaignphoto)

            def fileName = mhsr.name
            println("=================="+fileName)
            if(!mhsr?.empty && mhsr.size < 1024*2000){

                mhsr.transferTo( new File("C:\\Users\\Abhi\\IdeaProjects\\Digital_Marketing\\grails-app\\assets\\images/${fileName}.jpg") )

            }

        }catch(FileNotFoundException fnfe){

            fnfe.printStackTrace()

            render "path is not available"

        } catch(MissingPropertyException mpe){

            mpe.printStackTrace()

            render "path is not available"

        }*/





        //PostUpdate post = new PostUpdate(new URL("https://www.w3schools.com/css/paris.jpg"));
        /*PostUpdate post = new PostUpdate(new URL("http://w3schools.com"))
                .picture(new URL("https://www.w3schools.com/css/paris.jpg"))
                .name("Facebook4J - A Java library for the Facebook Graph API")
                .caption("facebook4j.org")
                .description("Facebook4J is a Java library for the Facebook Graph API.");*/
        facebook.postFeed(post);



        //Facebook fb = new FacebookFactory().getInstance();
        //Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
//-------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------
        //facebook.postStatusMessage("Hello World from Facebook4J.")
        /*try {
            facebook.postStatusMessage(message);
        } catch (FacebookException e) {
            e.printStackTrace()
        }
        String url = request.getContextPath()+ "/";
        println("URL : "+url)
        redirect(uri:url);*/
    }
}
