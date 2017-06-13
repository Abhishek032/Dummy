package com.digital.user

import java.sql.Blob
class CampaignDetails {

    String campaignId
    String campaignName
    String campaignTitle
    String campaignLink
    String campaignMessage
    Blob campaignImage
    Blob campaignVideo
    String campaignUrl

    //static belongsTo = [user : User]
    static belongsTo = [facebookData : FacebookData]

    static constraints = {
        campaignId(nullable:true, blank:false)
        campaignName(nullable:true, blank:false)
        campaignTitle(nullable:true, blank:false)
        campaignLink(nullable:true, blank:false)
        campaignMessage(nullable:true, blank:false)
        campaignImage(nullable:true, blank:false)
        campaignVideo(nullable:true, blank:false)
        campaignUrl(nullable:true, blank:false)
    }
}
