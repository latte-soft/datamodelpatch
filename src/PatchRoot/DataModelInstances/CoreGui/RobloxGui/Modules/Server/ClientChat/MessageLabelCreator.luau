local v0 = {};
local l_Chat_0 = game:GetService("Chat");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_MessageCreatorModules_0 = l_ClientChatModules_0:WaitForChild("MessageCreatorModules");
local l_Util_0 = require(l_MessageCreatorModules_0:WaitForChild("Util"));
local l_Parent_0 = script.Parent;
local _ = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_ObjectPool_0 = require(l_Parent_0:WaitForChild("ObjectPool"));
local _ = require(l_Parent_0:WaitForChild("MessageSender"));
local v9 = {};
v9.__index = v9;
mergeProps = function(v10, v11)
    if v10 then
        for v12, v13 in pairs(v10) do
            v11[v12] = v13;
        end;
        return ;
    else
        return ;
    end;
end;
ReturnToObjectPoolRecursive = function(v14, v15)
    local l_v14_Children_0 = v14:GetChildren();
    for v17 = 1, #l_v14_Children_0 do
        ReturnToObjectPoolRecursive(l_v14_Children_0[v17], v15);
    end;
    v14.Parent = nil;
    v15:ReturnInstance(v14);
end;
GetMessageCreators = function()
    local v18 = {};
    local l_l_MessageCreatorModules_0_Children_0 = l_MessageCreatorModules_0:GetChildren();
    for v20 = 1, #l_l_MessageCreatorModules_0_Children_0 do
        if l_l_MessageCreatorModules_0_Children_0[v20]:IsA("ModuleScript") and l_l_MessageCreatorModules_0_Children_0[v20].Name ~= "Util" then
            local v21 = require(l_l_MessageCreatorModules_0_Children_0[v20]);
            v18[v21[l_Util_0.KEY_MESSAGE_TYPE]] = v21[l_Util_0.KEY_CREATOR_FUNCTION];
        end;
    end;
    return v18;
end;
v9.WrapIntoMessageObject = function(v22, v23, v24)
    local v25 = v24[l_Util_0.KEY_BASE_FRAME];
    local v26 = nil;
    if l_Util_0.KEY_BASE_MESSAGE then
        v26 = v24[l_Util_0.KEY_BASE_MESSAGE];
    end;
    return {
        ID = v23.ID, 
        BaseFrame = v25, 
        BaseMessage = v26, 
        UpdateTextFunction = v24[l_Util_0.KEY_UPDATE_TEXT_FUNC] or function()
            warn("NO MESSAGE RESIZE FUNCTION");
        end, 
        GetHeightFunction = v24[l_Util_0.KEY_GET_HEIGHT], 
        FadeInFunction = v24[l_Util_0.KEY_FADE_IN], 
        FadeOutFunction = v24[l_Util_0.KEY_FADE_OUT], 
        UpdateAnimFunction = v24[l_Util_0.KEY_UPDATE_ANIMATION], 
        ObjectPool = v22.ObjectPool, 
        Destroyed = false, 
        Destroy = function(v27)
            ReturnToObjectPoolRecursive(v27.BaseFrame, v27.ObjectPool);
            v27.Destroyed = true;
        end
    };
end;
v9.CreateMessageLabel_Chat = function(v28, v29, v30, v31)
    v29.Channel = v30;
    local v32 = nil;
    pcall(function()
        v32 = l_Chat_0:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, v29);
    end);
    v29.ExtraData = v29.ExtraData or {};
    mergeProps(v32, v29.ExtraData);
    local l_MessageType_0 = v29.MessageType;
    if not v28.MessageCreators[l_MessageType_0] then
        if not v28.DefaultCreatorType then
            error("No message creator available for message type: " .. l_MessageType_0);
        else
            local v34 = v28.MessageCreators[v28.DefaultCreatorType](v29, v30, v31);
            if v34 then
                return v28:WrapIntoMessageObject(v29, v34);
            end;
        end;
    else
        local v35 = v28.MessageCreators[l_MessageType_0](v29, v30, v31);
        if v35 then
            return v28:WrapIntoMessageObject(v29, v35);
        end;
    end;
end;
v9.CreateMessageLabel = function(v36, v37, v38)
    v37.Channel = v38;
    local v39 = nil;
    pcall(function()
        v39 = l_Chat_0:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, v37);
    end);
    v37.ExtraData = v37.ExtraData or {};
    mergeProps(v39, v37.ExtraData);
    local l_MessageType_1 = v37.MessageType;
    if not v36.MessageCreators[l_MessageType_1] then
        if not v36.DefaultCreatorType then
            error("No message creator available for message type: " .. l_MessageType_1);
        else
            local v41 = v36.MessageCreators[v36.DefaultCreatorType](v37, v38);
            if v41 then
                return v36:WrapIntoMessageObject(v37, v41);
            end;
        end;
    else
        local v42 = v36.MessageCreators[l_MessageType_1](v37, v38);
        if v42 then
            return v36:WrapIntoMessageObject(v37, v42);
        end;
    end;
end;
v0.new = function()
    local v43 = setmetatable({}, v9);
    v43.ObjectPool = l_ObjectPool_0.new(50);
    v43.MessageCreators = GetMessageCreators();
    v43.DefaultCreatorType = l_Util_0.DEFAULT_MESSAGE_CREATOR;
    l_Util_0:RegisterObjectPool(v43.ObjectPool);
    return v43;
end;
v0.GetStringTextBounds = function(_, v45, v46, v47, v48)
    return l_Util_0:GetStringTextBounds(v45, v46, v47, v48);
end;
return v0;
