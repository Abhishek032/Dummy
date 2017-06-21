package com.com

import com.digital.user.CampaignDetails
import com.digital.user.FacebookData
import com.restfb.BinaryAttachment
import com.restfb.DefaultFacebookClient
import com.restfb.FacebookClient
import com.restfb.Parameter
import com.restfb.types.FacebookType
import facebook4j.FacebookException


class PostController {
    def springSecurityService
    Boolean success=true
    def linkPost(CampaignDetails camp) {
        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        def fb=FacebookData.list()
        for(FacebookData data:fb)
        {
            if(data.userId==id){

                FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken());

                //First post then save-------------------------------------------

                /*if (params.campaignMessage != null) {
                    def link = params.campaignLink
                    def message = params.campaignMessage
                    FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("message", message),
                            Parameter.with("link", link));
                    camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                    System.out.println("facebook.com/" + response.getId());
                } else {
                    def link = params.campaignLink

                    FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("link", link));
                    camp.setCampaignUrl(response.getId())
                    System.out.println("facebook.com/" + response.getId());
                }
                data.addToCampaignDetails(camp).save()
                camp.save(flush: true)*/


                //First save then post from databse---------------------------------------

                data.addToCampaignDetails(camp).save()
                camp.save(flush: true)
                if(camp.getCampaignMessage()!=null){
                    def link = camp.getCampaignLink()
                    def message = camp.getCampaignMessage()
                    FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("message", message),
                            Parameter.with("link", link));
                    camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                    camp.save(flush: true)
                    println("facebook.com/" + response.getId());
                }else{
                    def link = camp.getCampaignLink()
                    FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("message", message),
                            Parameter.with("link", link));
                    camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                    camp.save(flush: true)
                    println("facebook.com/" + response.getId());
                }
            }
        }
        redirect(controller: 'camp', action: 'campaignPage')

    }

    def textPost(CampaignDetails camp) {
        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        def fb=FacebookData.list()
        for(FacebookData data:fb)
        {
            if(data.userId==id){
                FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken());

                data.addToCampaignDetails(camp).save()
                camp.save(flush: true)

                def message = camp.getCampaignMessage()
                FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("message", message));
                camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                camp.save(flush: true)
                System.out.println("facebook.com/" + response.getId());
            }
        }
        redirect(controller: 'camp', action: 'campaignPage')
    }

    def mediaPost(CampaignDetails camp) {
        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        def fb=FacebookData.list()
        for(FacebookData data:fb)
        {
            if(data.userId==id){
                FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken());
                //Receive file and save to database
                def fileUpload = request.getFile('fileupload')
                Byte[] file=fileUpload.getBytes()
                def filename=fileUpload.getOriginalFilename()
                def filetype=fileUpload.getContentType()
                camp.setMediaFile(file)
                camp.setMediaName(filename)
                camp.setMediaType(filetype)
                data.addToCampaignDetails(camp).save()
                camp.save(flush: true)


                def type=camp.getMediaType()
                String[] types=type.split("/")
                if(types[0].equals("image")){
                    if(camp.getCampaignMessage()!=null){
                        def message = camp.getCampaignMessage()
                        Byte[] media=camp.getMediaFile()
                        //def fis = FileUtils.writeByteArrayToFile(new File("pathname"), media)
                        InputStream fis = new ByteArrayInputStream(media);
                        FacebookType response = fbClient.publish("me/photos", FacebookType.class, BinaryAttachment.with("image.jpg", fis), Parameter.with("message", message))
                        camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                        camp.save(flush: true)
                        println("facebook.com/" + response.getId());
                    }else{
                        def media=camp.getMediaFile()
                        InputStream fis = new ByteArrayInputStream(media);
                        FacebookType response = fbClient.publish("me/photos", FacebookType.class, BinaryAttachment.with("image.jpg", fis))
                        camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                        camp.save(flush: true)
                        println("facebook.com/" + response.getId());
                    }
                }
                else if(types[0].equals("video")){
                    if(camp.getCampaignMessage()!=null){
                        def message = camp.getCampaignMessage()
                        Byte[] media=camp.getMediaFile()
                        //def fis = FileUtils.writeByteArrayToFile(new File("pathname"), media)
                        InputStream fis = new ByteArrayInputStream(media);
                        FacebookType response = fbClient.publish("me/videos", FacebookType.class, BinaryAttachment.with("video.mp4", fis), Parameter.with("message", message))
                        camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                        camp.save(flush: true)
                        println("facebook.com/" + response.getId());
                    }else{
                        def media=camp.getMediaFile()
                        InputStream fis = new ByteArrayInputStream(media);
                        FacebookType response = fbClient.publish("me/videos", FacebookType.class, BinaryAttachment.with("video.mp4", fis))
                        camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                        camp.save(flush: true)
                        println("facebook.com/" + response.getId());
                    }
                }else{
                        success=false
                }
            }
        }
        if(success)
            redirect(controller: 'camp', action: 'campaignPage')
        else
            redirect(controller: 'camp', action: 'ProblemCampaign')


    }
}