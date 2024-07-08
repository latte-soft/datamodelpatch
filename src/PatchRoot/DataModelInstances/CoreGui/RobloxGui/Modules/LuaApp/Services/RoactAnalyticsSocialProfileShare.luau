local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactAnalytics);
return {
    get = function(v1)
        local v2 = v0.get(v1);
        return {
            inviteePageLoad = function(v3, v4)
                v2.EventStream:setRBXEventStream("profileShareLink", "luaPageLoad", {
                    target = "mobile", 
                    referringUserId = v3, 
                    page = v4
                });
            end, 
            inviterButtonClick = function(v5)
                v2.EventStream:setRBXEventStream("profileShareLink", "buttonClick", {
                    btn = "userShareProfileLink", 
                    target = "mobile", 
                    page = v5
                });
            end
        };
    end
};
