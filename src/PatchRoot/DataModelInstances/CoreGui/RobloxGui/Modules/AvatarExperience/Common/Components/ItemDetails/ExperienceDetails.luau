local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local l_Common_0 = l_Modules_0.AvatarExperience.Common;
local v9 = require(l_Common_0.Components.RoactNavigation.AvatarScreen);
local _ = require(l_Common_0.Types);
local v11 = require(l_Common_0.Hooks.useItemInfo);
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_LinkButton_0 = v3.App.Button.LinkButton;
local l_MenuDirection_0 = v3.App.Menu.MenuDirection;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetAXInExperienceItemLinking);
return function(v17)
    if v16() then
        local v18 = l_useStyle_0();
        local l_Theme_0 = v18.Theme;
        local l_Font_0 = v18.Font;
        local v21 = v7({
            inMultipleExperiences = "Feature.Catalog.Label.InMultipleExperiences", 
            inSpecificExperience = "Feature.Catalog.Label.InSpecificExperience", 
            soldOut = "Feature.Catalog.Label.SoldOut"
        });
        local v22 = l_useNavigation_0();
        local v23 = v11(v17.itemId, v17.itemType);
        if v23 then
            assert(v23, "silence type checker");
            local l_collectibleItemId_0 = v23.collectibleItemId;
            if l_collectibleItemId_0 then
                local v26 = l_useSelector_0(function(v25)
                    return v25.AvatarExperience.Common.Collectibles.CollectiblesItemInfo[l_collectibleItemId_0];
                end);
                if v26 then
                    assert(v26, "silence type checker");
                    local l_experiences_0 = v26.experiences;
                    local l_isSoldOut_0 = v26.isSoldOut;
                    local v29 = nil;
                    if l_experiences_0 then
                        v29 = v2.createElement(l_LinkButton_0, {
                            text = if #l_experiences_0 == 1 then v21.inSpecificExperience:gsub("{EXPERIENCE_NAME}", l_experiences_0[1].name) else v21.inMultipleExperiences:gsub("{NUM_EXPERIENCES}", #l_experiences_0), 
                            onActivated = function()
                                v22.navigate(v9.ItemExperiencesMenu, {
                                    collectibleData = v26, 
                                    openPositionY = UDim.new(0, 100), 
                                    menuDirection = l_MenuDirection_0.Down
                                });
                            end
                        });
                    end;
                    return v6.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, l_Font_0.BaseSize * l_Font_0.Body.RelativeSize), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 0
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 4)
                        }), 
                        ExperienceLink = v29, 
                        DashDivider = if not l_isSoldOut_0 then nil else v2.createElement(l_StyledTextLabel_0, {
                            automaticSize = Enum.AutomaticSize.XY, 
                            text = "-", 
                            fontStyle = l_Font_0.Body, 
                            colorStyle = l_Theme_0.TextDefault, 
                            layoutOrder = 2
                        }), 
                        SoldOutText = if not l_isSoldOut_0 then nil else v2.createElement(l_StyledTextLabel_0, {
                            automaticSize = Enum.AutomaticSize.XY, 
                            text = v21.soldOut, 
                            fontStyle = l_Font_0.Body, 
                            colorStyle = l_Theme_0.TextDefault, 
                            layoutOrder = 3
                        })
                    });
                else
                    return nil;
                end;
            else
                return nil;
            end;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
