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
    def textPost(CampaignDetails camp) {
        String str=params.data
        String []gsp=str.split(",");
        ArrayList<Integer> gspdata=new ArrayList<Integer>()
        for(String s:gsp){
            if(s.equals("")){}
            else {
                gspdata.add(Integer.parseInt(s))
            }
        }

        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        def fb=FacebookData.list()
        Integer i=0;
        Integer no=0;
        int index

            for (FacebookData data : fb) {
                if (data.userId == id) {
                try{
                    index=gspdata.get(no)
                }catch (Exception e){
                    e.printStackTrace()
                }
                    if (i == index) {
                        data.addToCampaignDetails(camp).save()
                        camp.save(flush: true)
                        FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken())
                        def message = camp.getCampaignMessage()
                        FacebookType response = fbClient.publish("me/feed", FacebookType.class, Parameter.with("message", message))
                        camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                        camp.save(flush: true)
                        println("facebook.com/" + response.getId())
                        //--------------------------------------------------
                        no++
                    }
                    i++
                }

            }
        redirect(controller: 'camp', action: 'campaignPage')
    }

    def linkPost(CampaignDetails camp) {



        String str=params.data
        String []gsp=str.split(",");
        ArrayList<Integer> gspdata=new ArrayList<Integer>()
        for(String s:gsp){
            if(s.equals("")){}
            else {
                gspdata.add(Integer.parseInt(s))
            }
        }

        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        def fb=FacebookData.list()
        Integer i=0;
        Integer no=0;
        int index

        for (FacebookData data : fb) {
            if (data.userId == id) {
                try{
                    index=gspdata.get(no)
                }catch (Exception e){
                    e.printStackTrace()
                }
                if (i == index) {
                    data.addToCampaignDetails(camp).save()
                    camp.save(flush: true)
                    FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken());
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
                        FacebookType response = fbClient.publish("me/feed", FacebookType.class,
                                Parameter.with("link", link));
                        camp.setCampaignUrl("https://www.facebook.com/"+response.getId())
                        camp.save(flush: true)
                        println("facebook.com/" + response.getId());
                    }
                    //--------------------------------------------------
                    no++
                }
                i++
            }
        }
        redirect(controller: 'camp', action: 'campaignPage')
    }

    def mediaPost(CampaignDetails camp) {

        String str=params.data
        String []gsp=str.split(",");
        ArrayList<Integer> gspdata=new ArrayList<Integer>()
        for(String s:gsp){
            if(s.equals("")){}
            else {
                gspdata.add(Integer.parseInt(s))
            }
        }

        def currentUser = springSecurityService.currentUser
        def id=currentUser.getId()
        def fb=FacebookData.list()
        Integer i=0;
        Integer no=0;
        int index

        for (FacebookData data : fb) {
            if (data.userId == id) {
                try{
                    index=gspdata.get(no)
                }catch (Exception e){
                    e.printStackTrace()
                }
                if (i == index) {
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
                    FacebookClient fbClient = new DefaultFacebookClient(data.getAccessToken());

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
                    //--------------------------------------------------
                    no++
                }
                i++
            }
        }
        if(success)
            redirect(controller: 'camp', action: 'campaignPage')
        else
            redirect(controller: 'camp', action: 'ProblemCampaign')
    }
}