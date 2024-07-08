local l_Images_0 = require(game:GetService("CorePackages").UIBlox).App.ImageSet.Images;
local v1 = require(script.Parent.Parent.TopBar.Constants);
local v2 = require(script.Parent.Parent.Chrome.Enabled);
return function(v3)
    local v4 = {
        IsTenFoot = v3
    };
    if not v3 then
        v4.ContainerPadding = 4;
        v4.ContainerPosition = UDim2.new(1, -4, 0, 4);
        v4.ContainerSize = UDim2.new(0, 0, 0.5, 0);
        v4.ExtraContainerPadding = 16;
        v4.AnchorPoint = Vector2.new(1, 0);
        v4.PlayerDropDownSizeX = 300;
        v4.PlayerDropDownOffset = 4;
        v4.PlayerScrollListPosition = UDim2.new(0, 0, 0, 0);
        v4.PlayerScrollListSize = UDim2.new(1, -1, 1, 0);
        v4.EntryBaseSizeX = 150;
        v4.EntrySizeIncreasePerStat = 11;
        v4.PlayerEntrySizeY = 40;
        v4.EntryPadding = 0;
        v4.TeamEntrySizeY = 24;
        v4.StatEntrySizeX = 66;
        v4.TitleBarSizeY = 20;
        v4.EntryXOffset = 0;
        v4.TeamEntryBackgroundTransparency = 0.5;
        v4.IconButtonBackgroundTransparency = 0.3;
        v4.DropDownHeaderBackgroundTransparency = 0.1;
        v4.OverrideBackgroundTransparency = 0.3;
        v4.FadedBackgroundTransparency = 0.65;
        v4.FadedBackgroundScaleDelta = 0.05;
        v4.PlayerIconSize = UDim2.new(0, 16, 0, 16);
        v4.InitalPlayerEntryPadding = 12;
        v4.PlayerEntryPadding = 12;
        v4.PlayerEntryNamePadding = 4;
        v4.TeamEntryTextPadding = 15;
        v4.StatTextPadding = 4;
        v4.PlayerNameSize = UDim2.new(1, -34, 1, 0);
        v4.PlayerNameTextSize = 14;
        v4.StatTextSize = 14;
        v4.ScrollImageColor = Color3.fromRGB(216, 216, 216);
        v4.ScrollImageTransparency = 0.5;
        v4.ScrollBarOffset = 4;
        v4.ScrollBarSize = 8;
    else
        v4.ContainerPosition = UDim2.new(0.5, 0, 0.5, 0);
        v4.ContainerSize = UDim2.new(0, 350, 0, 720);
        v4.AnchorPoint = Vector2.new(0.5, 0.5);
        v4.PlayerDropDownSizeX = 0;
        v4.PlayerScrollListPosition = UDim2.new(0, 0, 0, 105);
        v4.PlayerScrollListSize = UDim2.new(1, 19, 1, 0);
        v4.PlayerScrollListInnerFramePosition = UDim2.new(0, 0, 0, 0);
        v4.PlayerScrollListInnerFrameSize = UDim2.new(1, 0, 1, 0);
        v4.EntrySizeX = 350;
        v4.PlayerEntrySizeY = 100;
        v4.EntryPadding = 5;
        v4.TeamEntrySizeY = 32;
        v4.StatEntrySizeX = 250;
        v4.EntryXOffset = -20;
        v4.BackgroundStyle = {
            Default = {
                Color = Color3.fromRGB(60, 60, 60), 
                Transparency = 0.25
            }, 
            Hovered = {
                Color = Color3.fromRGB(50, 181, 255), 
                Transparency = 0.25
            }, 
            HoveredTitle = {
                Color = Color3.fromRGB(50, 181, 255), 
                Transparency = 0
            }, 
            Title = {
                Color = Color3.fromRGB(25, 25, 25), 
                Transparency = 0
            }, 
            Selected = nil
        };
        v4.TeamEntryBackgroundTransparency = 0.25;
        v4.DefaultTextStyle = {
            Color = Color3.fromRGB(255, 255, 243), 
            Transparency = 0, 
            StrokeTransparency = 0.75, 
            StrokeColor = Color3.fromRGB(34, 34, 34)
        };
        v4.HoveredTextStyle = {
            Color = Color3.fromRGB(19, 19, 19), 
            Transparency = 0, 
            StrokeTransparency = 0.75, 
            StrokeColor = Color3.fromRGB(34, 34, 34)
        };
        v4.PlayerIconSize = UDim2.new(0, 64, 0, 64);
        v4.InitalPlayerEntryPadding = 18;
        v4.PlayerEntryPadding = 8;
        v4.PlayerEntryNamePadding = 8;
        v4.TeamEntryTextPadding = 5;
        v4.StatTextPadding = 0;
        v4.PlayerNameSize = UDim2.new(1, -88, 1, 0);
        v4.PlayerNameTextSize = 32;
        v4.StatTextSize = 32;
        v4.ScrollImageColor = Color3.fromRGB(31, 31, 31);
        v4.ScrollImageTransparency = 0.5;
    end;
    if not v2() then
        v4.TopBarOffset = 36;
    else
        v4.TopBarOffset = v1.TopBarHeight;
    end;
    v4.PlayerDropDownSizeXMobile = 327;
    v4.ScrollBarSizeMobile = 2;
    v4.PlayerNameSizeXMobile = 194;
    v4.PlayerIconSizeMobile = UDim2.fromOffset(20, 20);
    v4.PlayerNameTextSizeMobile = 16;
    v4.StatTextSizeMobile = 16;
    v4.PlayerNamePaddingXMobile = 14;
    v4.TeamEntryTextPadding = 15;
    v4.TeamEntryTextPaddingMobile = 14;
    v4.RowHoverColor = Color3.fromRGB(0, 0, 0);
    v4.RowDefaultColor = Color3.fromRGB(84, 84, 84);
    v4.MaxLeaderstats = 4;
    v4.MaxLeaderstatsSmallScreen = 1;
    v4.PlayerEntryFont = Enum.Font.SourceSans;
    v4.TitlePlayerEntryFont = Enum.Font.SourceSansBold;
    v4.TeamEntryFont = Enum.Font.SourceSans;
    v4.StatFont = Enum.Font.SourceSans;
    v4.TitleStatFont = Enum.Font.SourceSansBold;
    v4.TeamStatFont = Enum.Font.SourceSansBold;
    v4.StatNameFont = Enum.Font.SourceSans;
    v4.PlayerIconBackgroundSize = UDim2.new(0, 66, 0, 66);
    v4.PlayerBackgroundImage = "rbxasset://textures/ui/PlayerList/CharacterImageBackground.png";
    v4.RobloxIconImage = "rbxasset://textures/ui/Shell/Icons/RobloxIcon24.png";
    v4.IconSelectedColor = Color3.fromRGB(19, 19, 19);
    v4.IconUnSelectedColor = Color3.fromRGB(255, 255, 255);
    v4.SelectedEntryColor = Color3.fromRGB(0, 255, 255);
    v4.ShadowImage = "rbxasset://textures/ui/PlayerList/TileShadowMissingTop.png";
    v4.ShadowSize = 5;
    v4.ShadowSliceRect = Rect.new(6, 6, 9, 9);
    v4.DefaultThumbnail = "rbxasset://textures/ui/Shell/Icons/DefaultProfileIcon.png";
    v4.BlockedIcon = l_Images_0["icons/status/unavailable_small"];
    v4.FriendIcons = {
        [Enum.FriendStatus.Friend] = l_Images_0["icons/status/player/friend"], 
        [Enum.FriendStatus.FriendRequestReceived] = l_Images_0["icons/status/player/pending"]
    };
    v4.FollowingIcon = l_Images_0["icons/status/player/following"];
    v4.PlaceOwnerIcon = l_Images_0["icons/status/player/developer"];
    v4.MembershipIcons = {
        [Enum.MembershipType.Premium] = l_Images_0["icons/status/premium_small"]
    };
    v4.CustomPlayerIcons = {
        [7210880] = "rbxassetid://134032333", 
        [13268404] = "rbxassetid://113059239", 
        [261] = "rbxassetid://105897927"
    };
    v4.NeutralTeamColor = BrickColor.new("White");
    v4.NeutralTeamName = "Neutral";
    v4.DropDownButtonSizeY = 56;
    v4.DropDownButtonPadding = 0;
    v4.DropDownPadding = 10;
    v4.DropDownRightOptionSize = 55;
    v4.DropDownIconSize = 36;
    v4.DropDownHeaderSizeY = 80;
    v4.DropDownHeaderBackgroundSize = 65;
    v4.DropDownScreenSidePadding = 4;
    v4.VoiceChatShieldColor = Color3.fromRGB(41, 41, 41);
    v4.VoiceChatShieldTransparency = 0.2;
    setmetatable(v4, {
        __index = function(_, v6)
            error(string.format("%q is not a valid member of LayoutValues", (tostring(v6))), 2);
        end
    });
    return v4;
end;
