local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v6 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_CorePackages_0.Cryo);
local v9 = require(l_CorePackages_0.UIBlox);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelectionCursor_0 = v9.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v9.App.SelectionImage.CursorKind;
local v13 = require(l_Modules_0.LuaApp.Flags.FFlagDebugShowSiteMessageBanner);
local v14 = require(l_Modules_0.LuaApp.Flags.FFlagShowDOTADogfoodSiteMessage);
local v15 = v2.PureComponent:extend("SiteMessageBanner");
v15.init = function(v16)
    local v17 = true;
    v16.navigate = function()
        if not (not v16.props.messageLink or not v17) then
            v17 = false;
            v16.props.linking:isURLRegistered(v16.props.messageLink):andThen(function(v18)
                if not v18 then
                    v16.props.navigateDown({
                        name = v7.GenericWebPage, 
                        detail = v16.props.messageLink, 
                        extraProps = {
                            title = v16.props.messageText
                        }
                    });
                else
                    v16.props.linking:detectURL(v16.props.messageLink);
                end;
                v17 = true;
            end);
        end;
    end;
end;
v15.render = function(v19)
    local l_messageText_0 = v19.props.messageText;
    local l_Size_0 = v19.props.Size;
    local l_Position_0 = v19.props.Position;
    local v23 = v19.props[v2.Change.AbsoluteSize];
    if v14 then
        l_messageText_0 = "Happy Dogfooding";
    end;
    if not (not v13 or l_messageText_0) then
        l_messageText_0 = "Testing the SiteMessageBanner";
    end;
    local l_designTokens_0 = v19.props.designTokens;
    local l_autoButtonColor_0 = l_designTokens_0.autoButtonColor;
    local l_cornerRadius_0 = l_designTokens_0.cornerRadius;
    local l_strokeColor_0 = l_designTokens_0.strokeColor;
    local l_Color3_0 = l_designTokens_0.textColor.Color3;
    local l_Transparency_0 = l_designTokens_0.textColor.Transparency;
    local l_Font_0 = l_designTokens_0.typography.Font;
    local l_FontSize_0 = l_designTokens_0.typography.FontSize;
    local l_verticalPadding_0 = l_designTokens_0.verticalPadding;
    local l_horizontalPadding_0 = l_designTokens_0.horizontalPadding;
    return v2.createElement("TextButton", {
        Position = l_Position_0, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = if not l_messageText_0 then nil else Enum.AutomaticSize.Y, 
        AutoButtonColor = l_autoButtonColor_0, 
        BackgroundColor3 = l_designTokens_0.backgroundColor.Color3, 
        BackgroundTransparency = l_designTokens_0.backgroundColor.Transparency, 
        SelectionImageObject = v19.props.selectionCursor, 
        BorderSizePixel = 0, 
        Text = "", 
        [v2.Change.AbsoluteSize] = v23, 
        [v2.Event.Activated] = v19.navigate
    }, {
        Padding = l_messageText_0 and v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_horizontalPadding_0), 
            PaddingRight = UDim.new(0, l_horizontalPadding_0), 
            PaddingTop = UDim.new(0, l_verticalPadding_0), 
            PaddingBottom = UDim.new(0, l_verticalPadding_0)
        }), 
        MessageTextLabel = l_messageText_0 and v2.createElement("TextLabel", {
            Size = l_Size_0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Font = l_Font_0, 
            TextSize = l_FontSize_0, 
            TextColor3 = l_Color3_0, 
            TextTransparency = l_Transparency_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Text = l_messageText_0, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = true
        }), 
        UIStroke = if not l_strokeColor_0 then nil else v2.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = l_strokeColor_0.Color3, 
            Transparency = l_strokeColor_0.Transparency, 
            Thickness = 1
        }), 
        UICorner = if not l_cornerRadius_0 then nil else v2.createElement("UICorner", {
            CornerRadius = l_cornerRadius_0
        })
    });
end;
v15 = l_RoactServices_0.connect({
    linking = l_AppLinking_0
})((v3.connect(function(v34, _)
    return {
        messageText = v34.SiteMessage.Text, 
        messageLink = v34.SiteMessage.Link
    };
end, function(v36)
    return {
        navigateDown = function(v37)
            v36(v6(v37));
        end
    };
end)(v15)));
return function(v38)
    return v2.createElement(v15, v8.Dictionary.join(v38, {
        designTokens = l_useDesignTokens_0().LuaApps.Banner.siteMessageBanner, 
        selectionCursor = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect)
    }));
end;
