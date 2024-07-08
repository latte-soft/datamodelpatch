local v0 = require(script.Parent.utils.AppsFlyerUtil);
return function(v1)
    local v2 = {};
    v2.info = {
        webpage = v1.fromString("www:games/{placeId}"), 
        store = v1.fromString("www:games/store-section/{universeId}"), 
        badges = v1.fromString("www:games/badges-section/{universeId}"), 
        servers = v1.fromString("www:games/servers-section/{universeId}"), 
        serversPreopenCreateVip = v1.fromString("www:games/servers-section-preopen-create-vip/{universeId}"), 
        group = v1.fromString("www:groups/{creatorId}"), 
        user = v1.fromString("www:users/{creatorId}/profile"), 
        pass = v1.fromString("www:game-pass/{passId}"), 
        creator = function(v3)
            if v3.creatorType == "Group" then
                return v2.info.group(v3);
            elseif v3.creatorType == "User" then
                return v2.info.user(v3);
            else
                warn(string.format("%s - unknown creatorType of %s", tostring(script.name), (tostring(v3.creatorType))));
                return nil;
            end;
        end, 
        appsflyer = function(v4)
            local l_description_0 = v4.description;
            local l_image_0 = v4.image;
            local l_title_0 = v4.title;
            if (not l_description_0 or not l_image_0) or not l_title_0 then
                return v1.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
                    mobileUrl = v1.fromString("mobilenav:game_details?gameId={universeId}")(v4), 
                    webUrl = v2.info.webpage(v4)
                });
            else
                return v1.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_og_title={title}&af_og_image={image}&af_og_description={description}&af_dp={mobileUrl}&af_web_dp={webUrl}")({
                    image = l_image_0, 
                    title = l_title_0, 
                    description = v0.sanitizeDescription(l_description_0), 
                    mobileUrl = v1.fromString("mobilenav:game_details?gameId={universeId}")(v4), 
                    webUrl = v2.info.webpage(v4)
                });
            end;
        end
    };
    v2.details = v1.fromString("games:games?{universeIds}");
    v2.playability = v1.fromString("games:games/multiget-playability-status?{universeIds}");
    v2.media = v1.fromString("games:games/{universeId}/media");
    v2.favorite = v1.fromString("games:games/{universeId}/favorites");
    v2.social = v1.fromString("games:games/{universeId}/social-links/list");
    v2.recommended = v1.fromString("games:games/recommendations/game/{universeId}?{paginationKey|}&{maxRows|6}");
    v2.thumbnail = v1.fromString("games:games/game-thumbnails?{height|150}&{width|150}&{imageTokens}");
    v2.vote = {
        all = v1.fromString("games:games/{universeId}/votes"), 
        get = v1.fromString("games:games/{universeId}/votes/user"), 
        set = v1.fromString("games:games/{universeId}/user-votes")
    };
    v2.follow = {
        get = v1.fromString("followings:users/{userId}/universes/{universeId}/status"), 
        set = v1.fromString("followings:users/{userId}/universes/{universeId}")
    };
    v2.report = v1.fromString("www:abusereport/asset?id={placeId}");
    v2.place = v1.fromString("games:games/multiget-place-details?{placeIds}");
    return v2;
end;
