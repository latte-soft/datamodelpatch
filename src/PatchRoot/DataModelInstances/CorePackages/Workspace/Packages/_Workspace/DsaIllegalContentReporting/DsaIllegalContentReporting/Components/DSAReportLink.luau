local l_script_FirstAncestor_0 = script:FindFirstAncestor("DsaIllegalContentReporting");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_script_FirstAncestor_0.Utility.Constants);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_Parent_0.React);
local l_StyleProviderWithDefaultTheme_0 = require(l_CorePackages_0.Workspace.Packages.Style).StyleProviderWithDefaultTheme;
local l_LinkButton_0 = v6.App.Button.LinkButton;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v11 = {
    OPEN_CUSTOM_WEBVIEW = 20
};
DSAReportLink = function()
    local v12 = l_useStyle_0();
    return v7.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        Layout = v7.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v7.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 16)
        }), 
        Divider = v7.createElement("Frame", {
            BackgroundColor3 = v12.Theme.Divider.Color, 
            BackgroundTransparency = v12.Theme.Divider.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            LayoutOrder = 0
        }), 
        Link = v7.createElement(l_LinkButton_0, {
            fontStyle = "Footer", 
            size = UDim2.new(0, 100, 0, 20), 
            text = "Report illegal content under the EU Digital Services Act.", 
            layoutOrder = 2, 
            onActivated = function()
                l_GuiService_0:BroadcastNotification(l_HttpService_0:JSONEncode({
                    title = "Report Illegal Content", 
                    presentationStyle = nil, 
                    visible = true, 
                    url = v4.DSA_REPORT_LINK
                }), v11.OPEN_CUSTOM_WEBVIEW);
            end
        })
    });
end;
WrapperContainer = function()
    return v7.createElement(l_StyleProviderWithDefaultTheme_0, {
        withDarkTheme = true
    }, {
        Button = v7.createElement(DSAReportLink)
    });
end;
return WrapperContainer;
