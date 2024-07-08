local l_Parent_0 = script.Parent.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v5 = require(l_Parent_0.t);
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local l_AsyncQueue_0 = require(l_Parent_0.AppCommonLib).AsyncQueue;
local l_GetFFlagEnableUnifiedWebViews_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableUnifiedWebViews;
local _ = require(script.Parent.WebViewProtocolTypes);
game:DefineFastFlag("EnableWebViewProtocolForTestingOnly", false);
local function v11(v10)
    return l_HttpService_0:JSONEncode({
        command = "config", 
        visible = v10.isVisible == true
    });
end;
local v12 = {
    OPEN_WINDOW_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("WebView", "openWindow"), 
        validateParams = v5.strictInterface({
            url = v5.string, 
            title = v5.optional(v5.string), 
            isVisible = v5.optional(v5.boolean), 
            searchParams = v5.optional(v5.strictInterface({
                searchType = v5.string
            })), 
            transitionAnimation = v5.optional(v5.string), 
            windowType = if not l_GetFFlagEnableUnifiedWebViews_0() then v5.string else v5.optional(v5.string), 
            visible = if not l_GetFFlagEnableUnifiedWebViews_0() then nil else v5.optional(v5.boolean)
        })
    }, 
    MUTATE_WINDOW_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("WebView", "mutateWindow"), 
        validateParams = v5.strictInterface({
            url = v5.optional(v5.string), 
            title = v5.optional(v5.string), 
            isVisible = v5.optional(v5.boolean), 
            searchParams = v5.optional(v5.strictInterface({
                searchType = v5.string
            })), 
            transitionAnimation = v5.optional(v5.string), 
            windowType = v5.optional(v5.string)
        })
    }, 
    CLOSE_WINDOW_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("WebView", "closeWindow"), 
        validateParams = v5.table
    }, 
    HANDLE_WINDOW_CLOSE_DESCRIPTOR = {
        mid = l_MessageBus_0.getMessageId("WebView", "handleWindowClose"), 
        validateParams = v5.table
    }
};
v12.__index = v12;
v12.new = function(v13, v14)
    local v15 = v13 or l_MessageBus_0;
    local v16 = {
        messageBus = v15, 
        browserService = if not l_GetFFlagEnableUnifiedWebViews_0() then nil else v14 or l_BrowserService_0, 
        subscriber = v15.Subscriber.new(), 
        queue = if not l_GetFFlagEnableUnifiedWebViews_0() then nil else l_AsyncQueue_0.new()
    };
    setmetatable(v16, v12);
    return v16;
end;
v12.openWindow = function(v17, v18)
    assert(v17.isEnabled());
    if l_GetFFlagEnableUnifiedWebViews_0() then
        if v17.shouldForceVisibleOnOpen() then
            v18.isVisible = true;
        end;
        if v17.shouldRenameIsVisibleParam() then
            v18.visible = v18.isVisible;
        end;
    end;
    v17.messageBus.publish(v17.OPEN_WINDOW_DESCRIPTOR, v18);
end;
v12.mutateWindow = function(v19, v20)
    assert(v19.isEnabled());
    local v21 = true;
    if not (not l_GetFFlagEnableUnifiedWebViews_0() or not v19.shouldForceBrowserServiceOnMutate()) then
        v21 = false;
    end;
    if not v21 then
        v19.browserService:SendCommand(v11(v20));
        return ;
    else
        v19.messageBus.publish(v19.MUTATE_WINDOW_DESCRIPTOR, v20);
        return ;
    end;
end;
v12.closeWindow = function(v22)
    assert(v22.isEnabled());
    v22.messageBus.publish(v22.CLOSE_WINDOW_DESCRIPTOR, {});
end;
v12.listenForWindowClose = function(v23, v24)
    assert(v23.isEnabled());
    v23.subscriber:subscribe(v23.HANDLE_WINDOW_CLOSE_DESCRIPTOR, function()
        v24();
    end, false);
end;
v12.stopListeningForWindowClose = function(v25)
    assert(v25.isEnabled());
    v25.subscriber:unsubscribe(v25.HANDLE_WINDOW_CLOSE_DESCRIPTOR);
end;
v12.listenForJavaScript = function(v26, v27)
    v26.javaScriptConnection = v26.browserService.JavaScriptCallback:Connect(v27);
end;
v12.stopListeningForJavaScript = function(v28)
    if v28.javaScriptConnection ~= nil then
        v28.javaScriptConnection:Disconnect();
        v28.javaScriptConnection = nil;
    end;
end;
v12.stopListening = function(v29)
    assert(v29.isEnabled());
    v29.subscriber:unsubscribeFromAllMessages();
end;
v12.request = function(v30, v31)
    return v30.queue:request(v31);
end;
v12.isEnabled = function()
    return game:GetEngineFeature("WebViewProtocol") or game:GetFastFlag("EnableWebViewProtocolForTestingOnly");
end;
v12.shouldForceVisibleOnOpen = function()
    local v32 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
        v32 = l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX;
    end;
    return v32;
end;
v12.shouldRenameIsVisibleParam = function()
    return l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
end;
v12.shouldForceBrowserServiceOnMutate = function()
    return l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP;
end;
v12.default = v12.new();
return v12;
