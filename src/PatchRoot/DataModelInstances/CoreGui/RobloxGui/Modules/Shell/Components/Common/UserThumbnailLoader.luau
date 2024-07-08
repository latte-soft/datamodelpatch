local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Components_0 = l_Modules_0.Shell.Components;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Shell.GlobalSettings);
local v4 = require(l_Modules_0.Common.RoactRodux);
local v5 = require(l_Modules_0.Shell.Thunks.ApiFetchUserThumbnail);
local v6 = require(l_Components_0.Common.Spinner);
local v7 = require(l_Modules_0.Common.memoize);
local v8 = v2.PureComponent:extend("UserThumbnailLoader");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_rbxuid_0 = l_props_0.rbxuid;
    local v12 = {};
    local v13 = "";
    if l_rbxuid_0 and l_rbxuid_0 > 0 then
        if not l_props_0.hasThumbnailData or not l_props_0.imageUrl then
            l_props_0.fetchImage(l_rbxuid_0, l_props_0.thumbnailType, l_props_0.thumbnailSize);
        else
            v13 = l_props_0.imageUrl;
        end;
        if l_props_0.showSpinner then
            v12.Spinner = l_props_0.isFetching and v2.createElement(v6);
        end;
    else
        v12.XboxDefaultProfileImage = v2.createElement("ImageLabel", {
            Size = UDim2.new(0.5, 0, 0.5, 0), 
            Position = UDim2.new(0.25, 0, 0.25, 0), 
            BackgroundTransparency = 1, 
            Image = v3.Images.DefaultProfile
        });
    end;
    return v2.createElement("ImageLabel", {
        Image = v13, 
        Size = l_props_0.size or UDim2.new(1, 0, 1, 0), 
        Position = l_props_0.position or UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = l_props_0.backgroundTransparency or 0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_props_0.backgroundColor3 or v3.Colors.CharacterBackground
    }, v12);
end;
local v15 = v7(function(v14)
    return {
        hasThumbnailData = v14 ~= nil, 
        isFetching = v14 and v14.isFetching, 
        imageUrl = v14 and v14.imageUrl
    };
end);
return v4.connect(function(v16, v17)
    local l_rbxuid_1 = v17.rbxuid;
    local l_thumbnailType_0 = v17.thumbnailType;
    local l_thumbnailSize_0 = v17.thumbnailSize;
    local v21 = nil;
    if not ((not (l_rbxuid_1 and l_rbxuid_1 > 0) or not l_thumbnailType_0) or not l_thumbnailSize_0) then
        v21 = v16.UserThumbnails[table.concat({
            l_rbxuid_1, 
            l_thumbnailType_0.Name, 
            l_thumbnailSize_0.Name
        })];
    end;
    return v15(v21);
end, function(v22)
    return {
        fetchImage = function(v23, v24, v25)
            return v22(v5(v23, v24, v25, 6));
        end
    };
end)(v8);
