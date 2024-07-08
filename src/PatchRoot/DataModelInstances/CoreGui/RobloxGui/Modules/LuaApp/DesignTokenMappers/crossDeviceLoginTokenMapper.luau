local l_CorePackages_0 = game:GetService("CorePackages");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local _ = require(l_CorePackages_0.Workspace.Packages.Style);
local l_UiMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).UiMode;
return function(v5, v6)
    local l_Space_200_0 = v6.Global.Space_200;
    local l_Space_1000_0 = v6.Global.Space_1000;
    local l_Space_250_0 = v6.Global.Space_250;
    local l_Size_1200_0 = v6.Global.Size_1200;
    local v11 = {
        Font = l_AppFonts_0.default:getMedium(), 
        FontSize = 24
    };
    local v12 = {
        Font = l_AppFonts_0.default:getMedium(), 
        FontSize = 24
    };
    local v13 = {
        Font = l_AppFonts_0.default:getDefault(), 
        FontSize = 19
    };
    local l_Emphasis_0 = v6.Semantic.Color.Text.Emphasis;
    local l_Emphasis_1 = v6.Semantic.Color.Text.Emphasis;
    local l_Emphasis_2 = v6.Semantic.Color.Text.Emphasis;
    local v17 = {
        Font = l_AppFonts_0.default:getDefault(), 
        FontSize = 14
    };
    local l_Content_0 = v6.Semantic.Color.Action.Alert.Content;
    local v19 = 0;
    local l_Bottom_0 = Enum.VerticalAlignment.Bottom;
    local v21 = 1;
    if v5.uiMode == l_UiMode_0.TenFoot then
        l_Space_200_0 = v6.Global.Space_800;
        l_Space_1000_0 = v6.Global.Space_800;
        l_Space_250_0 = v6.Global.Space_300 + v6.Global.Space_200;
        l_Size_1200_0 = v6.Global.Size_800 * 2;
        v12 = v6.Semantic.Typography.Header;
        v11 = v6.Semantic.Typography.Subheader;
        v13 = v6.Semantic.Typography.Body;
        l_Emphasis_2 = v6.Semantic.Color.Text.Default;
        v17 = v6.Semantic.Typography.CaptionBody;
        v19 = v6.Global.Space_100;
        l_Bottom_0 = Enum.VerticalAlignment.Center;
        v21 = 0.5;
    end;
    return {
        verticalPadding = l_Space_250_0, 
        iconSize = l_Size_1200_0, 
        layoutHeaderFont = v12, 
        headerFont = v11, 
        bodyFont = v13, 
        layoutTextColor = l_Emphasis_0, 
        headerTextColor = l_Emphasis_1, 
        bodyTextColor = l_Emphasis_2, 
        textAlertFont = v17, 
        textAlertColor = l_Content_0, 
        headerPadding = v19, 
        warningTextVerticalAlignment = l_Bottom_0, 
        buttonFrameWidth = v21, 
        getDevicePadding = function(v22)
            if not v22 then
                return l_Space_200_0;
            else
                return l_Space_1000_0;
            end;
        end
    };
end;
