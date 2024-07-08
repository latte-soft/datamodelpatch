local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.Shell.Http);
local v4 = require(l_Modules_0.Shell.LoadingWidget);
local v5 = require(l_Modules_0.Shell.Utility);
local l_Decal_0 = Instance.new("Decal");
local function _(v7)
    l_Decal_0.Texture = v7;
    l_ContentProvider_0:PreloadAsync({
        l_Decal_0
    });
end;
local v10 = {
    Sizes = {
        Small = Vector2.new(100, 100), 
        Medium = Vector2.new(250, 250), 
        Large = Vector2.new(576, 324)
    }, 
    Init = function(v9)
        v9._active = true;
        v9.isLoading = false;
        v9.isRequesting = false;
        v9.imageObjects = {};
        v9.loadingProps = {};
        v9.newRequests = nil;
        v9.requests = nil;
        v9.uriMap = {};
        v9.loaders = {};
        v9.activeTry = 0;
    end
};
local function _(v11, v12)
    return tostring(v11) .. tostring(v12);
end;
v10.CreateThumbnail = function(v14, v15, v16, v17, v18, v19, v20)
    v20 = v20 or {};
    if v18 == nil then
        v18 = true;
    end;
    if v19 == nil then
        v19 = true;
    end;
    local v21 = false;
    local v22 = tostring(v16) .. tostring(v17);
    if not v14._active then
        v10:Init();
    end;
    if v14.isLoading == false then
        v21 = true;
        if v14.newRequests == nil then
            v14.newRequests = {};
        end;
    end;
    if v14.newRequests[v17] == nil then
        v14.newRequests[v17] = {};
    end;
    table.insert(v14.newRequests[v17], v16);
    if v14.imageObjects[v22] == nil then
        v14.imageObjects[v22] = {};
    end;
    v14.imageObjects[v22][v15] = v15;
    v14.loadingProps[v15] = {};
    v14.loadingProps[v15].showSpinner = v18;
    v14.loadingProps[v15].fadeImage = v19;
    v14.loadingProps[v15].spinnerProperties = v20;
    if v14.uriMap[v22] ~= nil then
        spawn(function()
            l_Decal_0.Texture = v14.uriMap[v22];
            l_ContentProvider_0:PreloadAsync({
                l_Decal_0
            });
            v10:_loadImage(v15, v14.uriMap[v22]);
        end);
        return ;
    else
        v10:_loadImage(v15, nil);
        if v21 then
            spawn(function()
                v10:BatchLoadThumbnailsAsync();
            end);
        end;
        return ;
    end;
end;
v10._loadImage = function(v23, v24, v25)
    local v26 = v25 ~= nil;
    if v24 == nil then
        return ;
    else
        v24.Image = "";
        if v23.loadingProps[v24].fadeImage then
            local _ = v5.PropertyTweener(v24, "ImageTransparency", 1, 1, 0, v5.EaseInOutQuad, true, nil);
        end;
        if v26 then
            if v23.loaders[v24] then
                v23.loaders[v24]:Cleanup();
                v23.loaders[v24] = nil;
            end;
            v24.Image = v25;
            if v23.loadingProps[v24].fadeImage then
                local _ = v5.PropertyTweener(v24, "ImageTransparency", 1, 0, 0.25, v5.EaseInOutQuad, true, nil);
            end;
        elseif v23.loadingProps[v24].showSpinner then
            v23.loadingProps[v24].spinnerProperties.Parent = v23.loadingProps[v24].spinnerProperties.Parent or v24;
            v23.loaders[v24] = v4(v23.loadingProps[v24].spinnerProperties, nil, true);
            return ;
        end;
        return ;
    end;
end;
v10._loadThumbnails = function(v29, v30, v31)
    local v32 = nil;
    local v33 = {};
    local v34 = 0;
    while #v30 > 0 do
        v34 = v34 + 1;
        v32 = {};
        if #v30 <= 30 then
            v32 = v30;
            v30 = {};
        else
            for _ = 1, 30 do
                table.insert(v32, (table.remove(v30)));
            end;
        end;
        local v36 = v3.GetAssetThumbnailBatchAsync(v32, v31.x, v31.y);
        if not v36 then
            for _, v38 in ipairs(v32) do
                table.insert(v33, v38);
            end;
        else
            for v39, v40 in ipairs(v36) do
                local v41 = v32[v39];
                if not v40.final then
                    table.insert(v33, v41);
                else
                    local l_url_0 = v40.url;
                    local v43 = tostring(v41) .. tostring(v31);
                    v29.uriMap[v43] = l_url_0;
                    for _, v45 in pairs(v29.imageObjects[v43]) do
                        spawn(function()
                            l_Decal_0.Texture = v29.uriMap[v43];
                            l_ContentProvider_0:PreloadAsync({
                                l_Decal_0
                            });
                            v10:_loadImage(v45, v29.uriMap[v43]);
                        end);
                    end;
                end;
            end;
        end;
    end;
    return v33;
end;
v10._batchLoadThumbnails = function(_, v47)
    if v47 == nil then
        return nil;
    else
        local v48 = false;
        local v49 = {};
        for v50, v51 in pairs(v47) do
            local v52 = v10:_loadThumbnails(v51, v50);
            if #v52 ~= 0 then
                if v49[v50] == nil then
                    v49[v50] = {};
                end;
                v48 = true;
                v49[v50] = v52;
            end;
        end;
        if v48 then
            return v49;
        else
            return nil;
        end;
    end;
end;
local function v64(v53, v54)
    local v55 = {};
    if v54 ~= nil then
        for v56, v57 in pairs(v54) do
            v55[v56] = {};
            for _, v59 in ipairs(v57) do
                table.insert(v55[v56], v59);
            end;
        end;
    end;
    if v53 ~= nil then
        for v60, v61 in pairs(v53) do
            if v55[v60] == nil then
                v55[v60] = {};
            end;
            for _, v63 in ipairs(v61) do
                table.insert(v55[v60], v63);
            end;
        end;
    end;
    return v55;
end;
v10._tryBatchLoadThumbnails = function(v65, v66)
    local v67 = 1;
    while v67 <= 6 and v66 == v65.activeTry do
        v65.isRequesting = true;
        v65.requests = v10:_batchLoadThumbnails(v65.requests);
        v65.isRequesting = false;
        if v65.requests ~= nil then
            v67 = v67 + 1;
            wait(v67 ^ 2);
        else
            break;
        end;
    end;
end;
v10.BatchLoadThumbnailsAsync = function(v68)
    while true do
        wait(0.1);
        if not (not (v68.isRequesting == false) or v68.isLoading ~= false) then
            break;
        end;
    end;
    v68.isLoading = true;
    if v68.newRequests == nil then
        v68.isLoading = false;
        return ;
    else
        v68.requests = v64(v68.newRequests, v68.requests);
        v68.newRequests = nil;
        v68.isLoading = false;
        if v68.requests ~= nil then
            v68.activeTry = tick();
            v10:_tryBatchLoadThumbnails(v68.activeTry);
        end;
        return ;
    end;
end;
v10.SetTransparency = function(v69, v70, v71)
    if v69.loaders[v71] ~= nil then
        v69.loaders[v71]:SetTransparency(v70);
    end;
end;
return v10;
