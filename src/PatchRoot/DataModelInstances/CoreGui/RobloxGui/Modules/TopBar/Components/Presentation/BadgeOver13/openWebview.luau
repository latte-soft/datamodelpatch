local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
return function(v2)
    l_GuiService_0:BroadcastNotification(l_HttpService_0:JSONEncode({
        title = if not game:GetEngineFeature("SetWebViewTitle") then nil else "Help Center", 
        presentationStyle = ({
            FullScreen = 0, 
            FormSheet = 2
        }).FormSheet, 
        visible = true, 
        url = v2
    }), 20);
end;
