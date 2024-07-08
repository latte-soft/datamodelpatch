local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Analytics.Events.search);
local v2 = require(l_Modules_0.LuaApp.Analytics.Events.nsOpenCTAShown);
local v3 = require(l_Modules_0.LuaApp.Analytics.Events.nsOpenContent);
local v4 = require(l_Modules_0.LuaApp.Analytics.Events.buttonClick);
local v5 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
return {
    get = function(v6)
        local v7 = v5.get(v6);
        local v8 = {};
        local function _(v9, v10, v11)
            v1(v7.EventStream, v9, v10, v11);
        end;
        v8.reportSearchButtonClick = function(v13)
            v4(v7.EventStream, v13, "search");
        end;
        v8.reportSearchFocused = function(v14)
            v1(v7.EventStream, v14, "open", nil);
        end;
        v8.reportSearched = function(v15, v16)
            v1(v7.EventStream, v15, "search", v16);
        end;
        v8.reportSearchCanceled = function(v17)
            v1(v7.EventStream, v17, "cancel", nil);
        end;
        v8.reportNSButtonTouch = function(v18)
            v3(v7.EventStream, "touch", v18);
        end;
        v8.reportNSOpenCTAShown = function(v19)
            v2(v7.EventStream, "seen", v19);
        end;
        v8.reportRobuxButtonClick = function(v20)
            v4(v7.EventStream, v20, "robux");
        end;
        v8.reportBackButtonClick = function(v21)
            v4(v7.EventStream, v21, "back");
        end;
        v8.reportAddFriendsButtonClick = function(v22)
            v4(v7.EventStream, v22, "addFriends");
        end;
        return v8;
    end
};
