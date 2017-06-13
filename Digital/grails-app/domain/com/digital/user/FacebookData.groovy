package com.digital.user

import com.digital.auth.User


class FacebookData {
    String accessToken
    String facebookName
    String facebookId

    static belongsTo = [user : User]
    static hasMany = [campaignDetails : CampaignDetails]

    static constraints = {
        accessToken(nullable:true, blank:false)
        facebookName(nullable:true, blank:false)
        facebookId(nullable:true, blank:false)
    }
}
