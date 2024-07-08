return function(v0)
    return {
        appsflyer = function(v1)
            return v0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
                mobileUrl = v0.fromString("mobilenav:event_details?eventid={eventId}")(v1), 
                webUrl = v0.fromString("www:events/{eventId}")(v1)
            });
        end
    };
end;
