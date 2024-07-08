local v0 = require(script.Parent.EventNames);
local v1 = require(script.Parent.Parent.Enums);
local l_Contexts_0 = v1.Contexts;
local l_EventTypes_0 = v1.EventTypes;
local l_SubPages_0 = v1.SubPages;
local l_Pages_0 = v1.Pages;
local v6 = require(script.Parent.BtnValues);
local function v8(v7)
    return (tostring(v7));
end;
return {
    [v0.HomePage_Carousel_LuaProfile] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v6.PlayerProfile, 
            subpage = l_SubPages_0.PeekView, 
            page = l_Pages_0.PlayerProfile
        }, 
        formatRulesForAdditionalInfo = {
            uid = v8
        }
    }, 
    [v0.HomePage_Carousel_FriendsLanding] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v6.FriendsLanding
        }, 
        formatRulesForAdditionalInfo = {
            uid = v8
        }
    }, 
    [v0.MorePage_FriendsLanding] = {
        context = l_Contexts_0.HomePage, 
        eventType = l_EventTypes_0.ButtonClick, 
        additionalInfo = {
            btn = v6.FriendsLanding
        }, 
        formatRulesForAdditionalInfo = {
            uid = v8
        }
    }
};
