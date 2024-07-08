local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.SetActiveTab);
local v2 = require(script.Parent.Parent.Actions.SetTabList);
return function(v3, v4)
    local v5 = v3 or {
        isDeveloperView = false, 
        isClientView = true, 
        tabList = {}, 
        currTabIndex = nil
    };
    if v4.type == v1.name then
        if v5.tabList[v4.newTabIndex] then
            local v6 = {
                currTabIndex = v4.newTabIndex, 
                isClientView = v4.isClientView
            };
            if v5.currTabIndex ~= v4.newTabIndex then
                v6.isClientView = true;
            end;
            local v7 = v0.JoinDictionaries(v5, v6);
            if v6.isClientView == nil then
                v7 = v0.RemoveFromDictionary(v7, "isClientView");
            end;
            return v7;
        end;
    elseif not (not (v4.type == v2.name) or not v4.tabList[v4.initIndex]) then
        return v0.JoinDictionaries(v5, {
            currTabIndex = v4.initIndex, 
            tabList = v4.tabList, 
            isDeveloperView = v4.isDeveloperView, 
            isClientView = true
        });
    end;
    return v5;
end;
