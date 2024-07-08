local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
local l_TestingAnalytics_0 = require(l_script_FirstAncestor_0.Parent.SocialLuaAnalytics).TestingAnalytics;
local l_mockAnalytics_0 = l_TestingAnalytics_0.mockAnalytics;
local l_mockLogger_0 = l_TestingAnalytics_0.mockLogger;
local l_setupFireEvent_0 = require(l_script_FirstAncestor_0.Analytics).setupFireEvent;
return function(v5, v6)
    local v7 = if not not v5 and v5.uid then v5.uid else "123";
    local v8 = l_mockAnalytics_0(v6);
    return {
        uid = v7, 
        value = {
            fireEvent = l_setupFireEvent_0({
                analytics = v8, 
                loggerImpl = l_mockLogger_0, 
                infoForAllEvents = {
                    uid = v7
                }
            })
        }, 
        mockLogger = l_mockLogger_0(v6), 
        analyticsMock = v8
    };
end;
