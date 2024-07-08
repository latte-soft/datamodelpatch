local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.UIBlox);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.React);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_DropdownMenu_0 = v2.App.Menu.DropdownMenu;
local v7 = require(l_script_FirstAncestor_0.Components.MenuItems.ReportMenuItem);
local l_useStyle_0 = v2.Core.Style.useStyle;
local v9 = require(l_Parent_0.Cryo);
return function(v10)
    local l_Theme_0 = l_useStyle_0().Theme;
    return v4.createElement(v7, {
        label = v10.label, 
        layoutOrder = v10.layoutOrder, 
        rightComponent = if v10.readonlyValue ~= nil then v4.createElement("TextLabel", {
            Text = v10.readonlyValue, 
            Font = l_AppFonts_0.default:getMedium(), 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
            TextSize = 20, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1
        }) else v4.createElement(l_DropdownMenu_0, {
            placeholder = "Choose One", 
            onChange = v10.onSelect, 
            height = UDim.new(0, 48), 
            screenSize = Vector2.new(2400, 1800), 
            errorState = false, 
            showDropShadow = true, 
            fixedListHeight = 180, 
            cellDatas = v9.List.map(v10.selections, function(v12)
                return {
                    text = v12
                };
            end)
        }), 
        menuContainerWidth = v10.menuContainerWidth
    });
end;
