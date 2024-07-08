return require(game:GetService("CoreGui").RobloxGui.Modules.Common.Action)("FetchUserThumbnail", function(v0)
    v0 = v0 or {};
    return {
        rbxuid = v0.rbxuid, 
        thumbnailType = v0.thumbnailType, 
        thumbnailSize = v0.thumbnailSize
    };
end);
