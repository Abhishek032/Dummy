package com.grails

import com.restfb.BinaryAttachment
import com.restfb.DefaultFacebookClient
import com.restfb.FacebookClient
import com.restfb.Parameter
import com.restfb.types.FacebookType
import facebook4j.Facebook
import facebook4j.FacebookException
import facebook4j.PostUpdate
import facebook4j.auth.AccessToken
import grails.core.GrailsApplication

import java.io.*
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class PostController {

    AccessToken info
    String text
    String accessToken


    def postaction() {

        String Dir = "C:\\Users/Abhi/IdeaProjects/Digital_Marketing/grails-app/assets/images/";




        def fileUpload = request.getFile('fileupload')
        def filename = fileUpload.getOriginalFilename()
        println("Filename : "+filename)
        println "fileupload : "+fileUpload
        //String tempPath = grailsApplication.config.jsonToCsvReplace;//.replace("temporary.json", "temporary"+new Date().getTime()+".json")

        String tempPath = grailsApplication.config.getRequiredProperty('grails.guides.folderPath')
        println("path : "+tempPath)
        tempPath=tempPath+"/"+filename
        println("Temppath : "+tempPath)
        File tempFile= new File(tempPath)
        fileUpload.transferTo(tempFile)


        //GSP parameters
        def message = params.campaignmessage


        Facebook facebook = (Facebook)session.getAttribute("facebook")

        //AccessToken Retrival
        try {
            info = facebook.getOAuthAccessTokenInfo()
        } catch (FacebookException e) {
            e.printStackTrace()
        }
        text=info.toString();

        String[] firstSplit=text.split("token='")
        String[] secondSplit=firstSplit[1].split("'")
        accessToken=secondSplit[0]


        //Post using Graph API
        FacebookClient fbClient=new DefaultFacebookClient(accessToken);
        try{
            FileInputStream fis = new FileInputStream(new File(tempPath));
            FacebookType response= fbClient.publish("me/photos", FacebookType.class, BinaryAttachment.with("image.jpg", fis))
            println("facebook.com/"+response.getId())

        }catch (Exception ex){
            ex.printStackTrace()
        }



        //pOSTing videos
        try
        {
            FileInputStream fisv = new FileInputStream(new File(tempPath))
            FacebookType responsev =fbClient.publish("me/videos", FacebookType.class, BinaryAttachment.with("video.mp4", fisv))
            println("facebook.com/"+responsev.getId())
        }
        catch (Exception e){
            e.printStackTrace()
        }
        redirect (controller: 'camp', action: 'campaignPage')
    }
}
