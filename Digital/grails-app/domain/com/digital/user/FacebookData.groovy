package com.digital.user

import com.digital.auth.User


class FacebookData {

    static belongsTo = [user : User]
    static hasMany = [campaignDetails : CampaignDetails]

    String accessToken
    String facebookName
    String facebookId

    static constraints = {
        accessToken(nullable:true, blank:false)
        facebookName(nullable:true, blank:false)
        facebookId(nullable:true, blank:false)
    }

}
