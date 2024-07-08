local l_CoreGui_0 = game:GetService("CoreGui");
local l_TextService_0 = game:GetService("TextService");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_VoteFrame_0 = require(l_Shell_0:FindFirstChild("VoteFrame"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
return function(v7, v8, v9)
    local v10 = {};
    local v11 = l_Utility_0.Create("Frame")({
        Name = "GameDetailsStripContainer", 
        BackgroundTransparency = 1, 
        LayoutOrder = v9, 
        Parent = v7, 
        Position = v8
    });
    local _ = l_Utility_0.Create("UIListLayout")({
        Name = "GameDetailsStripContainerLayout", 
        Parent = v11, 
        Padding = UDim.new(0, 24), 
        FillDirection = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    local v13 = l_Utility_0.Create("Frame")({
        Name = "SponsoredContainer", 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Visible = false, 
        Parent = v11
    });
    local v14 = l_Utility_0.Create("ImageLabel")({
        Name = "sponsoredLabelFrame", 
        Image = "rbxasset://textures/ui/Shell/Icons/WhiteSquare.png", 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(4, 4, 36, 36), 
        Parent = v13
    });
    local v15 = l_Utility_0.Create("TextLabel")({
        Name = "SponsoredLabelText", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        TextSize = 30, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Center, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Text = l_LocalizedStrings_0:LocalizedString("SponsoredGameWord"), 
        Parent = v13
    });
    local v16 = l_TextService_0:getTextSize(v15.Text, l_Utility_0.ConvertFontSizeEnumToInt(v15.FontSize), v15.Font, Vector2.new());
    v13.Size = UDim2.new(0, v16.X + 28, 0, v16.Y + 10);
    v14.Size = UDim2.new(1, 0, 1, 0);
    local v17 = l_Utility_0.Create("Frame")({
        Name = "VoteViewContainer", 
        Parent = v11, 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    });
    local _ = l_Utility_0.Create("UIListLayout")({
        Name = "VoteViewContainerLayout", 
        Parent = v17, 
        Padding = UDim.new(0, 12), 
        FillDirection = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    local _ = l_Utility_0.Create("ImageLabel")({
        Name = "ThumbsUpImage", 
        Size = UDim2.new(0, 28, 0, 28), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/ThumbsUpIcon@1080.png", 
        Parent = v17, 
        LayoutOrder = 1
    });
    local v20 = l_VoteFrame_0(v17, nil, nil, 2);
    local _ = l_Utility_0.Create("ImageLabel")({
        Name = "ThumbsDownImage", 
        Size = UDim2.new(0, 28, 0, 28), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/ThumbsDownIcon@1080.png", 
        Parent = v17, 
        LayoutOrder = 3
    });
    local _ = l_Utility_0.Create("ImageLabel")({
        Name = "SeparatorDot1", 
        Size = UDim2.new(0, 10, 0, 10), 
        LayoutOrder = 3, 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/SeparatorDot@1080.png", 
        Parent = v11
    });
    local v23 = l_Utility_0.Create("Frame")({
        Name = "CreatorContainer", 
        Parent = v11, 
        BackgroundTransparency = 1, 
        LayoutOrder = 4
    });
    local _ = l_Utility_0.Create("UIListLayout")({
        Name = "CreatorContainerLayout", 
        Parent = v23, 
        Padding = UDim.new(0, 12), 
        FillDirection = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    local _ = l_Utility_0.Create("ImageLabel")({
        Name = "CreatorIcon", 
        Size = UDim2.new(0, 24, 0, 24), 
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/RobloxIcon24.png", 
        Parent = v23
    });
    local v26 = l_Utility_0.Create("TextLabel")({
        Name = "CreatorName", 
        Size = UDim2.new(0, 0, 0, 0), 
        LayoutOrder = 2, 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Text = "", 
        Parent = v23
    });
    local v27 = l_Utility_0.Create("ImageLabel")({
        Name = "SeparatorDot2", 
        Size = UDim2.new(0, 10, 0, 10), 
        LayoutOrder = 5, 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/SeparatorDot@1080.png", 
        Parent = v11
    });
    local v28 = l_Utility_0.Create("Frame")({
        Name = "GameRatingContainer", 
        Parent = v11, 
        BackgroundTransparency = 1, 
        LayoutOrder = 6
    });
    local _ = l_Utility_0.Create("UIListLayout")({
        Name = "GameRatingContainerLayout", 
        Parent = v28, 
        Padding = UDim.new(0, 12), 
        FillDirection = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder
    });
    local v30 = l_Utility_0.Create("TextLabel")({
        Name = "GameRatingName", 
        Size = UDim2.new(0, 0, 0, 0), 
        LayoutOrder = 2, 
        AnchorPoint = Vector2.new(0, 0.5), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Text = "", 
        Parent = v28
    });
    local function v39(v31)
        if not v31:IsA("GuiObject") then
            error("trying to set size of a non gui object");
        end;
        local l_v31_Children_0 = v31:GetChildren();
        local v33 = 0;
        local v34 = -1;
        local v35 = 0;
        local v36 = 0;
        for _, v38 in ipairs(l_v31_Children_0) do
            if v38:IsA("UIListLayout") then
                v35 = v38.Padding.Offset;
            end;
            if not (not v38:IsA("GuiObject") or not v38.Visible) then
                v33 = v33 + v38.Size.X.Offset;
                v34 = math.max(v34, v38.Size.Y.Offset);
                v36 = v36 + 1;
            end;
        end;
        v31.Size = UDim2.new(0, v33 + v35 * (v36 - 1), 0, v34);
    end;
    v39(v17);
    v39(v28);
    local function _(v40)
        local v41 = not not v40 and v40.UpVotes or 0;
        local v42 = not not v40 and v40.DownVotes or 0;
        if v41 == 0 and v42 == 0 then
            v20:SetPercentFilled(nil);
        else
            v20:SetPercentFilled(v41 / (v41 + v42));
        end;
        v39(v11);
    end;
    local function v46(v44)
        if v44 == nil then
            v28.Visible = false;
            v27.Visible = false;
            return ;
        else
            v28.Visible = true;
            v27.Visible = true;
            v30.Text = v44;
            local v45 = l_TextService_0:getTextSize(v30.Text, l_Utility_0.ConvertFontSizeEnumToInt(v30.FontSize), v30.Font, Vector2.new());
            v30.Size = UDim2.new(0, v45.X, 0, v45.Y);
            v39(v28);
            v39(v11);
            return ;
        end;
    end;
    local function v49(v47)
        if v47 == nil then
            v47 = "";
        end;
        v26.Text = v47;
        local v48 = l_TextService_0:getTextSize(v26.Text, l_Utility_0.ConvertFontSizeEnumToInt(v26.FontSize), v26.Font, Vector2.new());
        v26.Size = UDim2.new(0, v48.X, 0, v48.Y);
        v39(v23);
        v39(v11);
    end;
    v10.setIsSponsored = function(_, v51)
        v13.Visible = v51;
        v17.Visible = not v51;
        v39(v11);
    end;
    v10.setData = function(_, v53)
        local v54 = not not v53 and v53.VoteData or nil;
        local v55 = not not v54 and v54.UpVotes or 0;
        local v56 = not not v54 and v54.DownVotes or 0;
        if v55 == 0 and v56 == 0 then
            v20:SetPercentFilled(nil);
        else
            v20:SetPercentFilled(v55 / (v55 + v56));
        end;
        v39(v11);
        v46(not not v53 and v53.ageDisplayName or nil);
        v49(not not v53 and v53.CreatorName or nil);
    end;
    v10.setVoteView = function(_, v58)
        local v59 = not not v58 and v58.UpVotes or 0;
        local v60 = not not v58 and v58.DownVotes or 0;
        if v59 == 0 and v60 == 0 then
            v20:SetPercentFilled(nil);
        else
            v20:SetPercentFilled(v59 / (v59 + v60));
        end;
        v39(v11);
    end;
    return v10;
end;
