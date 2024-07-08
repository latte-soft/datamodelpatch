local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v3 = require(l_Parent_0.Fetch);
local v4 = require(l_Parent_0.Promise);
local l_fetch_0 = v3.fetch;
local l_Response_0 = v3.Response;
local l_HttpService_0 = game:GetService("HttpService");
local v8 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "age-verification-service/v1/persona-id-verification/verified-status", 
    query = {
        token = "{token}"
    }
});
local v9 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "age-verification-service/v1/persona-id-verification/start-verification"
});
return {
    startVerification = function()
        local l_l_fetch_0_0 = l_fetch_0;
        return v4.new(function(v11, v12)
            local v13 = l_l_fetch_0_0(v9(), {
                method = "POST", 
                body = l_HttpService_0:JSONEncode({
                    generatedLink = true
                }), 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function()
                return l_Response_0.error();
            end):expect();
            if v13.ok then
                local v14 = v13:json():catch(function()
                    return nil;
                end):expect();
                if v14 then
                    v11({
                        emailSent = v14.emailSent, 
                        sessionIdentifier = v14.sessionIdentifier, 
                        daysUntilNextVerification = v14.daysUntilNextVerification, 
                        verificationLink = v14.verificationLink
                    });
                    return ;
                else
                    v12("Failed to decode HTTP response as JSON for IDV Verification");
                    return ;
                end;
            else
                v12(string.format("Got start-verification HTTP Response: %d", v13.status));
                return ;
            end;
        end);
    end, 
    getVerifiedStatus = function(v15)
        local l_l_fetch_0_1 = l_fetch_0;
        return v4.new(function(v17, v18)
            local v19 = l_l_fetch_0_1(v8({
                token = v15
            }), {
                method = "GET"
            }):catch(function()
                return l_Response_0.error();
            end):expect();
            if v19.ok then
                local v20 = v19:json():catch(function()
                    return nil;
                end):expect();
                if v20 then
                    v17({
                        isPending = v20.isPending, 
                        sessionStatus = v20.sessionStatus, 
                        sessionErrorCode = v20.sessionErrorCode, 
                        isVerified = v20.isVerified
                    });
                    return ;
                else
                    v18("Failed to decode HTTP response as JSON for get IDV Verification status");
                    return ;
                end;
            else
                v18(string.format("Got verified-status verification HTTP Response: %d", v19.status));
                return ;
            end;
        end);
    end
};
