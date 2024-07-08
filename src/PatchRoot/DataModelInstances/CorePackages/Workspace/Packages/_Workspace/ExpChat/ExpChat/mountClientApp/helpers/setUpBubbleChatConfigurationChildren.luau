local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v3 = require(l_Actions_0.BubbleChatSettingsChanged);
local v4 = require(l_Actions_0.BubbleChatChildSettingChanged);
local v5 = require(l_Actions_0.BubbleChatChildRemoved);
local v6 = require(l_script_FirstAncestor_0.Config);
local v7 = require(l_script_FirstAncestor_0.Flags.getSetUpBubbleChatConfigurationChildProperties);
local l_DefaultBubbleChatChildrenCustomizationProperties_0 = v6.DefaultBubbleChatChildrenCustomizationProperties;
local v9 = {
    "ImageLabel", 
    "UIGradient", 
    "UICorner", 
    "UIPadding"
};
local function v15(v10)
    local v11 = l_DefaultBubbleChatChildrenCustomizationProperties_0[v10.ClassName];
    local v12 = {};
    for v13, _ in pairs(v11) do
        if v10[v13] ~= nil then
            v12[v13] = v10[v13];
        end;
    end;
    return v12;
end;
local function v22(v16, v17)
    local v18 = l_DefaultBubbleChatChildrenCustomizationProperties_0[v17.ClassName];
    local v19 = {};
    for v20, _ in pairs(v18) do
        if v17[v20] ~= nil then
            table.insert(v19, (v17:GetPropertyChangedSignal(v20):Connect(function()
                v16:dispatch(v4(v17.ClassName, v20, v17[v20]));
            end)));
        end;
    end;
    return v19;
end;
local _ = function(v23)
    if v23 then
        for _, v25 in ipairs(v23) do
            v25:Disconnect();
        end;
    end;
end;
local _ = function(v27)
    for _, v29 in ipairs(v9) do
        if v29 == v27.ClassName then
            return true;
        end;
    end;
    return false;
end;
return function(v31)
    local l_BubbleChatConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("BubbleChatConfiguration");
    if not (l_BubbleChatConfiguration_0 ~= nil) or v7() == false then
        return l_DefaultBubbleChatChildrenCustomizationProperties_0;
    else
        local v33 = {};
        local v34 = {};
        assert(l_BubbleChatConfiguration_0 ~= nil, "BubbleChatConfiguration cannot be nil.");
        for _, v36 in ipairs({
            l_BubbleChatConfiguration_0:FindFirstChildOfClass("ImageLabel"), 
            l_BubbleChatConfiguration_0:FindFirstChildOfClass("UIGradient"), 
            l_BubbleChatConfiguration_0:FindFirstChildOfClass("UICorner"), 
            (l_BubbleChatConfiguration_0:FindFirstChildOfClass("UIPadding"))
        }) do
            if v36 then
                v33[v36.ClassName] = v15(v36);
                v34[v36.ClassName] = v22(v31, v36);
            end;
        end;
        l_BubbleChatConfiguration_0.ChildRemoved:Connect(function(v37)
            local v38;
            for _, v40 in ipairs(v9) do
                if v40 == v37.ClassName then
                    v38 = true;
                    goto label0 --[[  true, false  ]];
                end;
            end;
            v38 = false;
            ::label0::;
            if v38 then
                v38 = v34[v37.ClassName];
                if v38 then
                    for _, v42 in ipairs(v38) do
                        v42:Disconnect();
                    end;
                end;
                v34[v37.ClassName] = nil;
                v31:dispatch(v5(v37.ClassName));
                v38 = l_BubbleChatConfiguration_0:FindFirstChildOfClass(v37.ClassName);
                if v38 then
                    v31:dispatch(v3(v37.ClassName, (v15(v38))));
                    v34[v38.ClassName] = v22(v31, v38);
                end;
            end;
        end);
        l_BubbleChatConfiguration_0.ChildAdded:Connect(function(v43)
            local v44;
            for _, v46 in ipairs(v9) do
                if v46 == v43.ClassName then
                    v44 = true;
                    goto label1 --[[  true, false  ]];
                end;
            end;
            v44 = false;
            ::label1::;
            if v44 and v31:getState().BubbleChatSettings[v43.ClassName] == nil then
                v31:dispatch(v3(v43.ClassName, (v15(v43))));
                v34[v43.ClassName] = v22(v31, v43);
            end;
        end);
        return v33;
    end;
end;
