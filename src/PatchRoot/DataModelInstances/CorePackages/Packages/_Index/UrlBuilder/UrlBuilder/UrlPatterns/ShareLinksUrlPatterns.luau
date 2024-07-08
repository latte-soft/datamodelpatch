return function(v0)
    return {
        appsflyer = function(v1, v2)
            local v3 = {
                linkId = v1, 
                linkType = v2
            };
            return v0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
                mobileUrl = v0.fromString("mobilenav:share_links?code={linkId}&type={linkType}")(v3), 
                webUrl = v0.fromString("www:share-links?code={linkId}&type={linkType}")(v3)
            });
        end, 
        shortUrl = function(v4)
            return v0.fromString("www:share?code={linkId}&type={type}&stamp={stamp|}")(v4);
        end
    };
end;
