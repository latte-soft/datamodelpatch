local v0 = require(script.Parent.ChallengeHeaders);
local v1 = require(script.Parent.BuildChallengeWebViewUrl);
local _ = require(script.Parent.BuildHybridCallback);
local l_BrowserService_0 = game:GetService("BrowserService");
local l_HttpService_0 = game:GetService("HttpService");
local v5 = {};
v5.__index = v5;
v5.new = function(v6)
    local v7 = {
        browserService = v6.browserService or l_BrowserService_0, 
        challengeUrl = v1(v0.new(v6.rawResponseHeaders)), 
        title = v6.title
    };
    if v6.hybridCallback ~= nil then
        v7.hybridCallback = v6.hybridCallback;
    end;
    v7.hybridCallbackConnection = nil;
    return (setmetatable(v7, v5));
end;
v5.setHybridCallback = function(v8, v9)
    v8.hybridCallback = v9;
end;
v5.open = function(v10)
    assert(v10.hybridCallback ~= nil, "hybrid callback has not been initialized");
    v10.hybridCallbackConnection = v10.browserService.JavaScriptCallback:Connect(v10.hybridCallback);
    assert(string.len(v10.challengeUrl) > 0, "challenge url must have been constructed");
    assert(v10.hybridCallbackConnection ~= nil, "hybrid callback connection should be initialized");
    v10.browserService:SendCommand((l_HttpService_0:JSONEncode({
        command = "open", 
        url = v10.challengeUrl, 
        title = v10.title, 
        visible = true, 
        modal = false, 
        isGenericWebview = true, 
        enableOverlayReplacement = true
    })));
end;
v5.close = function(v11)
    if v11.hybridCallbackConnection ~= nil then
        v11.hybridCallbackConnection:Disconnect();
    end;
    v11.browserService:CloseBrowserWindow();
end;
return v5;
