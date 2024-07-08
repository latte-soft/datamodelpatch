local l_TextService_0 = game:GetService("TextService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Shell.GameData);
local v3 = require(l_Modules_0.Shell.GlobalSettings);
local v4 = require(l_Modules_0.Shell.ThumbnailLoader);
local v5 = require(l_Modules_0.Shell.Utility);
local v6 = require(l_Modules_0.Shell.GameDetailsStrip);
local v7 = require(l_Modules_0.Shell.Experiment.XboxPrimaryNavIXPTest);
local function v27(v8, v9, v10)
    local v11 = {};
    local v12 = not not v10 and Color3.new(0.4, 0.4, 0.4) or Color3.new(1, 1, 1);
    local v13 = v5.Create("Frame")({
        Name = "ThumbViewContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Parent = v9
    });
    local function v14()
        return v5.Create("ImageLabel")({
            Name = "ThumbImage", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ImageTransparency = 1, 
            ImageColor3 = v12, 
            Parent = v13
        });
    end;
    local v15 = false;
    v11.KillView = function(_)
        v15 = true;
        v13.Parent = nil;
    end;
    local v17 = {};
    if v8 and #v8 > 0 then
        local v18 = v14();
        table.insert(v17, v18);
        local v19 = v4:Create(v18, v8[1], v4.Sizes.Large, v4.AssetType.Icon, false);
        spawn(function()
            v19:LoadAsync(true, true);
            if #v8 > 1 then
                for v20 = 2, #v8 do
                    local v21 = v14();
                    table.insert(v17, v21);
                    local v22 = v4:Create(v21, v8[v20], v4.Sizes.Large, v4.AssetType.Icon, false);
                    spawn(function()
                        v22:LoadAsync(true, false);
                    end);
                end;
                local v23 = 1;
                while not v15 do
                    wait(4);
                    if not v15 then
                        v5.PropertyTweener(v17[v23], "ImageTransparency", 0, 1, 1, v5.EaseOutQuad, true);
                        v23 = v23 + 1;
                        if #v8 < v23 then
                            v23 = 1;
                        end;
                        v5.PropertyTweener(v17[v23], "ImageTransparency", 1, 0, 1, v5.EaseOutQuad, true);
                    else
                        break;
                    end;
                end;
            end;
        end);
    end;
    v11.SetImageColor = function(_, v25)
        if v25 then
            v12 = v25;
            for v26 = 1, #v17 do
                v17[v26].ImageColor3 = v12;
            end;
            return ;
        else
            return ;
        end;
    end;
    return v11;
end;
return function()
    local v28 = {};
    local v29 = false;
    v28.PlaceId = nil;
    local v30 = {};
    local v31 = UDim2.new(0, 0, 0, 196);
    local v32 = UDim2.new(0, 0, 0, 116);
    local v33 = v5.Create("Frame")({
        Name = "ViewContainer", 
        Size = UDim2.new(0, 1690, 0, 380), 
        Position = UDim2.new(0, 0, 0, -84), 
        BackgroundTransparency = 1
    });
    local v34 = v5.Create("Frame")({
        Name = "DetailsContainer", 
        Size = UDim2.new(0, 900, 0, 216), 
        Position = v31, 
        BackgroundTransparency = 1, 
        Parent = v33
    });
    local v35 = v5.Create("TextLabel")({
        Name = "GameTitle", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, 0, 0, 18), 
        BackgroundTransparency = 1, 
        Font = v3.RegularFont, 
        FontSize = v3.HeaderSize, 
        Text = "", 
        TextColor3 = v3.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Parent = v34
    });
    local v36 = not v7.isUserEnrolled() and 374 or 324;
    local v37 = not v7.isUserEnrolled() and 700 or 596;
    local v38 = v5.Create("Frame")({
        Name = "GameImageContainer", 
        Size = UDim2.new(0, v37, 0, v36), 
        Position = UDim2.new(1, -v37, 0, 380 - v36), 
        BackgroundTransparency = 1, 
        Parent = v33
    });
    local v39 = v6(v34, UDim2.new(0, 0, 0, 83), nil);
    local v40 = v5.Create("TextLabel")({
        Name = "DescriptionText", 
        Size = UDim2.new(1, 0, 0, 92), 
        Position = UDim2.new(0, 0, 1, -92), 
        BackgroundTransparency = 1, 
        Text = "", 
        TextColor3 = v3.LightGreyTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = v3.LightFont, 
        TextWrapped = true, 
        FontSize = v3.DescriptionSize, 
        Parent = v34
    });
    local function v45(v41)
        if not v41 or v41 == v35.Text then
            return ;
        else
            local function _(v42)
                return l_TextService_0:GetTextSize(v42, v5.ConvertFontSizeEnumToInt(v35.FontSize), v35.Font, Vector2.new(0, 0)).X;
            end;
            local v44 = "";
            while v35.Parent.AbsoluteSize.X < l_TextService_0:GetTextSize(v41 .. v44, v5.ConvertFontSizeEnumToInt(v35.FontSize), v35.Font, Vector2.new(0, 0)).X do
                v41 = string.sub(v41, 1, -2);
                v44 = "...";
            end;
            v35.Text = v41 .. v44;
            return ;
        end;
    end;
    local function _(v46)
        if not v46 or v46 == v40.Text then
            return ;
        else
            v40.Text = v46;
            return ;
        end;
    end;
    local v48 = nil;
    local function _(v49, v50)
        if v48 then
            v48:KillView();
            v48 = nil;
        end;
        if v49 and #v49 > 1 then
            v48 = v27(v49, v38, v50);
        end;
    end;
    v28.SetParent = function(_, v53)
        v33.Parent = v53;
    end;
    v28.TweenTransparency = function(_, v55, v56)
        for _, v58 in pairs((v34:GetDescendants())) do
            if not v58:IsA("TextLabel") then
                if v58:IsA("ImageLabel") then
                    v5.PropertyTweener(v58, "ImageTransparency", v58.ImageTransparency, v55, v56, v5.Linear, true);
                end;
            else
                v5.PropertyTweener(v58, "TextTransparency", v58.TextTransparency, v55, v56, v5.Linear, true);
            end;
        end;
    end;
    local function v59()
        v5.DisconnectEvents(v30);
        v30 = {};
        v28.PlaceId = nil;
        v45("");
        v39:setData(nil);
        if not (v40.Text == "") then
            v40.Text = "";
        end;
        if v48 then
            v48:KillView();
            v48 = nil;
        end;
    end;
    local v60 = 0;
    v28.SetGamePreview = function(_, v62, v63, v64)
        v5.DisconnectEvents(v30);
        v30 = {};
        local v65 = v2:GetGameData(v62) or v2:GetGameData(v62, true);
        if v65 then
            table.insert(v30, v65.OnGetGameDetailsEnd:connect(function(v66)
                v39:setData(v66);
                local v67 = v65.Description or "";
                if v67 then
                    if v67 == v40.Text then
                        return ;
                    else
                        v40.Text = v67;
                    end;
                end;
            end));
            table.insert(v30, v65.OnGetThumbnailIdsEnd:connect(function(v68)
                local l_v63_0 = v63;
                if v48 then
                    v48:KillView();
                    v48 = nil;
                end;
                if v68 and #v68 > 1 then
                    v48 = v27(v68, v38, l_v63_0);
                end;
            end));
            v45(v65.Name);
            v39:setIsSponsored(v64);
            v60 = v60 + 1;
            table.insert(v30, v65.OnGetVoteDataEnd:connect(function(v70)
                v39:setVoteView(v70);
            end));
            v39:setData(v65);
            local v71 = v65.Description or "";
            if not (not v71 or v71 == v40.Text) then
                v40.Text = v71;
            end;
            v71 = v65.ThumbnailIds;
            if v48 then
                v48:KillView();
                v48 = nil;
            end;
            if v71 and #v71 > 1 then
                v48 = v27(v71, v38, v63);
            end;
            spawn(function()
                if not (v65.VoteData or not v29) then
                    v65:GetVoteDataAsync();
                end;
                if not (v65.Description or not v29) then
                    v65:GetGameDetailsAsync();
                end;
                if not (v65.ThumbnailIds or not v29) then
                    v65:GetThumbnailIdsAsync();
                end;
            end);
            return ;
        else
            v59();
            return ;
        end;
    end;
    v28.Remove = function(_)
        v33:Destroy();
    end;
    v28.Focus = function(v73)
        if not v29 then
            v29 = true;
            v73:TweenTransparency(0, v3.TabDockTweenDuration);
            v5.PropertyTweener(v34, "Position", v34.Position, v32, v3.TabDockTweenDuration, v5.SCurveUDim2, true);
            return ;
        else
            return ;
        end;
    end;
    v28.RemoveFocus = function(v74)
        v5.DisconnectEvents(v30);
        v30 = {};
        if v29 then
            v28.PlaceId = nil;
            v29 = false;
            v5.PropertyTweener(v34, "Position", v34.Position, v31, v3.TabDockTweenDuration, v5.SCurveUDim2, true);
            v74:TweenTransparency(1, v3.TabDockTweenDuration);
            if v48 then
                v48:KillView();
                v48 = nil;
            end;
            return ;
        else
            return ;
        end;
    end;
    return v28;
end;
