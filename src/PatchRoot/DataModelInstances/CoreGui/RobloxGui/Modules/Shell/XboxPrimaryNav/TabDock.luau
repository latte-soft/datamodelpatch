local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("GuiService");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_TabDockContext_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("TabDockContext"));
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.UIBlox);
local v8 = require(l_Shell_0.LocalizedStrings);
local l_Images_0 = v7.App.ImageSet.Images;
local v10 = require(script.Parent.Components.GlobalNav);
local v11 = require(script.Parent.Components.AvatarIcon);
findTabInstances = function(v12)
    local v13 = {};
    for _, v15 in ipairs(v12) do
        if not (v15.ClassName ~= "ImageButton") or v15.ClassName == "Focusable" then
            table.insert(v13, v15);
        end;
    end;
    table.sort(v13, function(v16, v17)
        return v16.LayoutOrder < v17.LayoutOrder;
    end);
    return v13;
end;
local v18 = {
    "icons/menu/home_on", 
    "icons/menu/games_on", 
    "icons/menu/friendsOn", 
    "icons/common/search", 
    "icons/common/goldrobux", 
    "icons/common/settings"
};
local v19 = {};
for _, v21 in v18, nil, nil do
    v19[v21] = l_Images_0[v21];
    v19[v21].ImageRectOffset = v19[v21].ImageRectOffset + Vector2.new(1, 1);
    v19[v21].ImageRectSize = v19[v21].ImageRectSize - Vector2.new(2, 2);
end;
local function _(v22)
    return function()
        v22("ButtonA");
    end;
end;
return function(v24)
    local v25 = v6.useContext(l_TabDockContext_0.RoactContext);
    local v26, v27 = v6.useState(nil);
    local v28, v29 = v6.useState(nil);
    local v31 = v6.useCallback(function(v30)
        if v30 then
            v27(v30);
        end;
    end);
    v6.useEffect(function()
        if not v26 then
            return ;
        else
            local v32 = findTabInstances(v26:FindFirstChild("GlobalNavStart", true):FindFirstChild("MainTabList", true):GetChildren());
            local v33 = v25.SelectedTabIdxChanged:connect(v29);
            local v37 = v25.TabContextUpdateSignal:connect(function(v34)
                for v35, v36 in ipairs(v34) do
                    v36:configureContext(v32[v35]);
                end;
            end);
            v25:configureContext(v26);
            return function()
                l_Utility_0.DisconnectEvent(v33);
                l_Utility_0.DisconnectEvent(v37);
            end;
        end;
    end, {
        v26
    });
    local function v38()
        return v6.createElement(v11, {
            userId = v24.userId
        });
    end;
    local v39 = {};
    local v40 = {
        title = v8:LocalizedString("HomeWord"), 
        icon = v19["icons/menu/home_on"]
    };
    local function v42(v41)
        v25:activateTab(1, v41);
    end;
    local l_v42_0 = v42 --[[ copy: 11 -> 15 ]];
    v40.onActivated = function()
        l_v42_0("ButtonA");
    end;
    v40.showRoundedBackground = v28 == 1;
    local v44 = {
        title = v8:LocalizedString("GamesWord"), 
        icon = v19["icons/menu/games_on"]
    };
    local function v46(v45)
        v25:activateTab(2, v45);
    end;
    local l_v46_0 = v46 --[[ copy: 12 -> 16 ]];
    v44.onActivated = function()
        l_v46_0("ButtonA");
    end;
    v44.showRoundedBackground = v28 == 2;
    v42 = {
        title = v8:LocalizedString("AvatarWord")
    };
    local function v49(v48)
        v25:activateTab(3, v48);
    end;
    local l_v49_0 = v49 --[[ copy: 13 -> 17 ]];
    v42.onActivated = function()
        l_v49_0("ButtonA");
    end;
    v42.iconComponent = v38;
    v42.showRoundedBackground = v28 == 3;
    v46 = {
        title = v8:LocalizedString("FriendsWord"), 
        icon = v19["icons/menu/friendsOn"]
    };
    local function v52(v51)
        v25:activateTab(4, v51);
    end;
    local l_v52_0 = v52 --[[ copy: 14 -> 18 ]];
    v46.onActivated = function()
        l_v52_0("ButtonA");
    end;
    v46.showRoundedBackground = v28 == 4;
    setlist { ['R008[1 to 4]'] = 'R009 to R012' };
    v40 = {};
    v44 = {
        icon = v19["icons/common/search"]
    };
    v46 = v24.onOpenSearch;
    local l_v46_1 = v46 --[[ copy: 12 -> 19 ]];
    v44.onActivated = function()
        l_v46_1("ButtonA");
    end;
    v44.label = v8:LocalizedString("SearchWord");
    v42 = {
        icon = v19["icons/common/goldrobux"]
    };
    v49 = v24.onOpenStore;
    v42.onActivated = function()
        v49("ButtonA");
    end;
    v42.label = v8:LocalizedString("CatalogWord");
    v46 = {
        icon = v19["icons/common/settings"]
    };
    v52 = v24.onOpenSettings;
    v46.onActivated = function()
        v52("ButtonA");
    end;
    v46.label = v8:LocalizedString("SettingsWord");
    setlist { ['R009[1 to 3]'] = 'R010 to R012' };
    return v6.createElement(v10, {
        ref = v31, 
        primaryTabItems = v39, 
        secondaryTabItems = v40, 
        Position = UDim2.new(0, 0, 0.132, 0)
    });
end;
