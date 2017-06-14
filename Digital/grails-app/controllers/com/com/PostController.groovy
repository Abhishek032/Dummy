package com.com

import com.digital.user.FacebookData
import com.restfb.BinaryAttachment
import com.restfb.DefaultFacebookClient
import com.restfb.FacebookClient
import com.restfb.Parameter
import com.restfb.types.FacebookType
import facebook4j.FacebookException


class PostController {
    def springSecurityService

    def linkpost() {

        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        println("UserId : "+id)
        def fbdata = FacebookData.list()
        for(FacebookData data:fbdata)
        {
            if(data.userId==id){
                FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken());

                //Post Link
                if (params.campaignMessage != null) {
                    def link = params.campaignLink
                    def message = params.campaignMessage
                    FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("message", message),
                            Parameter.with("link", link));
                    System.out.println("facebook.com/" + response.getId());
                } else {
                    def link = params.campaignLink

                    FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("link", link));
                    System.out.println("facebook.com/" + response.getId());
                }
            }
        }
        redirect(controller: 'camp', action: 'campaignPage')
    }

    def textpost() {

        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        println("UserId : "+id)
        def fbdata = FacebookData.list()
        for(FacebookData data:fbdata) {
            if (data.userId == id) {
                FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken());

                //Post Message
                def message = params.campaignMessage
                FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("message", message));
                System.out.println("facebook.com/" + response.getId());
            }
        }
        redirect(controller: 'camp', action: 'campaignPage')
    }

    def imagepost() {
        //Retrieve Image-------------------------------------------
        def fileUpload = request.getFile('fileupload')
        def filename = fileUpload.getOriginalFilename()
        /*String tempPath = grailsApplication.config.jsonToCsvReplace;//.replace("temporary.json", "temporary"+new Date().getTime()+".json")*/
        String tempPath = grailsApplication.config.getRequiredProperty('grails.guides.folderPath')
        tempPath = tempPath + "/" + filename
        File tempFile = new File(tempPath)
        fileUpload.transferTo(tempFile)

        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        println("UserId : "+id)
        def fbdata = FacebookData.list()
        for(FacebookData data:fbdata) {
            if (data.userId == id) {
                FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken());
                //Post Image
                if (params.campaignMessage != null) {
                    def message = params.campaignMessage
                    try {
                        FileInputStream fis = new FileInputStream(new File(tempPath));
                        FacebookType response = fbClient.publish("me/photos", FacebookType.class, BinaryAttachment.with("image.jpg", fis), Parameter.with("message", message))
                        println("facebook.com/" + response.getId())

                    } catch (Exception ex) {
                        ex.printStackTrace()
                    }
                } else {
                    try {
                        FileInputStream fis = new FileInputStream(new File(tempPath));
                        FacebookType response = fbClient.publish("me/photos", FacebookType.class, BinaryAttachment.with("image.jpg", fis))
                        println("facebook.com/" + response.getId())

                    } catch (Exception ex) {
                        ex.printStackTrace()
                    }
                }
            }
        }
        redirect(controller: 'camp', action: 'campaignPage')
    }

    def videopost() {

        //Retrieve Video
        def fileUpload = request.getFile('fileupload')
        def filename = fileUpload.getOriginalFilename()
        //*String tempPath = grailsApplication.config.jsonToCsvReplace;//.replace("temporary.json", "temporary"+new Date().getTime()+".json")*//*
        String tempPath = grailsApplication.config.getRequiredProperty('grails.guides.folderPath')
        tempPath = tempPath + "/" + filename
        File tempFile = new File(tempPath)
        fileUpload.transferTo(tempFile)

        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        println("UserId : "+id)
        def fbdata = FacebookData.list()
        for(FacebookData data:fbdata) {
            if (data.userId == id) {
                FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken());

                //Post Video
                if (params.campaignMessage != null) {
                    def message = params.campaignMessage
                    FileInputStream fisv = new FileInputStream(new File("E:\\YouTube.mp4"));
                    FacebookType response1 = fbClient.publish("me/videos", FacebookType.class, BinaryAttachment.with("video1.mp4", fisv), Parameter.with("message", "Hiiiiiiiiiiiii"))
                    try {
                        FileInputStream fis = new FileInputStream(new File(tempPath));
                        println("message : "+message)
                        FacebookType response = fbClient.publish("me/videos", FacebookType.class, BinaryAttachment.with("video.mp4", fis), Parameter.with("message", message))
                        println("facebook.com/" + response.getId())

                    } catch (Exception ex) {
                        ex.printStackTrace()
                    }
                } else {
                    try {
                        FileInputStream fis = new FileInputStream(new File(tempPath));
                        FacebookType response = fbClient.publish("me/videos", FacebookType.class, BinaryAttachment.with("video.mp4", fis))
                        println("facebook.com/" + response.getId())

                    } catch (Exception ex) {
                        ex.printStackTrace()
                    }
                }
            }
        }
        redirect(controller: 'camp', action: 'campaignPage')
    }
}