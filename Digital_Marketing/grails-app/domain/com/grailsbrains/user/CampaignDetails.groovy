package com.grailsbrains.user

import com.grailsbrains.auth.User

/**
 * Created by Abhi on 23-05-2017.
 */
class CampaignDetails {
    String campaignId
    String campaignName
    String campaignTitle
    String campaignLink
    String campaignMessage
    String campaignUrl

    static belongsTo = [user : User]

    static constraints = {
        campaignId(nullable:true, blank:false)
        campaignName(nullable:true, blank:false)
        campaignTitle(nullable:true, blank:false)
        campaignLink(nullable:true, blank:false)
        campaignMessage(nullable:true, blank:false)
    }
}
