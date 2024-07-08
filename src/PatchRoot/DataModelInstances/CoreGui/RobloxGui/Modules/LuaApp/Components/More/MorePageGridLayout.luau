local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.UIBlox).Core.Style.useStyle;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.Components.More.Settings.MorePageSettings);
local v8 = require(l_Modules_0.LuaApp.Hooks.useMorePageItems);
local v9 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v10 = require(l_Modules_0.LuaApp.Components.More.MorePageContent);
local v11 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppSingleHeaderBar);
return function()
    local l_BackgroundDefault_0 = l_useStyle_0().Theme.BackgroundDefault;
    local v14 = l_useSelector_0(function(v13)
        return v13.FormFactor == l_FormFactor_0.WIDE;
    end);
    local v16 = l_useSelector_0(function(v15)
        return v15.TopBar.topBarHeight;
    end);
    local v17 = v8();
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_BackgroundDefault_0.Color, 
        BackgroundTransparency = l_BackgroundDefault_0.Transparency
    }, {
        TopBarMorePage = if not v11 then v2.createElement(v9.Container, {
            leftItem = v9.BackButton, 
            rightItems = {
                v9.BuyRobuxButton, 
                v9.NotificationsButton
            }
        }) else nil, 
        MorePageContent = v2.createElement(v10, {
            isWideView = v14, 
            itemTable = v2.useMemo(function()
                return v1.reduce(v17, function(v18, v19)
                    if v19.type == v7.SectionType.Navigation then
                        return {
                            v1.append(v18[1], v19.contents), 
                            v18[2]
                        };
                    elseif v19.type == v7.SectionType.Action then
                        return {
                            v18[1], 
                            v1.append(v18[2], v19.contents)
                        };
                    else
                        return v18;
                    end;
                end, {
                    {}, 
                    {}
                });
            end, {
                v17
            }), 
            topBarHeight = if not v11 then v16 else 0
        })
    });
end;
