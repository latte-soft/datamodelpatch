local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.ToastType);
local _ = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v4 = require(l_CorePackages_0.Workspace.Packages.ExperienceAnalytics);
local v5 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppRecommendedGamesCount);
local v6 = require(l_Modules_0.Personalization.Flags.getFFlagLuaAppHomeJoinYourFriendsDesktop);
local v7 = require(l_Modules_0.Personalization.Flags.GetFFlagExploreApiSortsEnabled);
local l_GetFFlagEnableNavBarLabels_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableNavBarLabels;
local v9 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local v10 = require(l_Modules_0.LuaApp.Components.NavbarExperimentation);
local l_FFlagOmniSearchAutoTabIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagOmniSearchAutoTabIXP;
local v12 = {
    Color = {
        GRAY1 = Color3.fromRGB(25, 25, 25), 
        GRAY2 = Color3.fromRGB(117, 117, 117), 
        GRAY3 = Color3.fromRGB(184, 184, 184), 
        GRAY4 = Color3.fromRGB(227, 227, 227), 
        GRAY5 = Color3.fromRGB(242, 242, 242), 
        GRAY6 = Color3.fromRGB(245, 245, 245), 
        GRAY_SEPARATOR = Color3.fromRGB(172, 170, 161), 
        GRAY_AVATAR_BACKGROUND = Color3.fromRGB(209, 209, 209), 
        BLACK = Color3.fromRGB(0, 0, 0), 
        WHITE = Color3.fromRGB(255, 255, 255), 
        BLUE_PRIMARY = Color3.fromRGB(0, 162, 255), 
        BLUE_HOVER = Color3.fromRGB(50, 181, 255), 
        BLUE_PRESSED = Color3.fromRGB(0, 116, 189), 
        BLUE_DISABLED = Color3.fromRGB(153, 218, 255), 
        GREEN_PRIMARY = Color3.fromRGB(2, 183, 87), 
        GREEN_HOVER = Color3.fromRGB(63, 198, 121), 
        GREEN_PRESSED = Color3.fromRGB(17, 130, 55), 
        GREEN_DISABLED = Color3.fromRGB(163, 226, 189), 
        RED_PRIMARY = Color3.fromRGB(226, 35, 26), 
        RED_NEGATIVE = Color3.fromRGB(216, 104, 104), 
        RED_HOVER = Color3.fromRGB(226, 118, 118), 
        RED_PRESSED = Color3.fromRGB(172, 30, 45), 
        BROWN_WARNING = Color3.fromRGB(162, 89, 1), 
        ORANGE = Color3.fromRGB(246, 136, 2), 
        ORANGE_FAVORITE = Color3.fromRGB(246, 183, 2), 
        ALPHA_SHADOW_PRIMARY = 0.3, 
        ALPHA_SHADOW_HOVER = 0.75
    }, 
    DisplayOrder = {
        BottomBar = 10, 
        SystemBar = 2, 
        ContextualListMenu = 11, 
        CentralOverlay = 12, 
        Toast = 13, 
        GamepadBottomBar = 14, 
        DrawerPanel = 15, 
        GameInviteModal = 10, 
        AntiAddictionPrompt = 100, 
        UpdateRequiredPrompt = 101, 
        FullscreenTitleBar = 150
    }, 
    DEFAULT_GAME_FETCH_COUNT = 40, 
    DEFAULT_RECOMMENDED_GAMES_FETCH_COUNT = 6, 
    MAX_RECOMMENDED_GAMES_FETCH_COUNT = v5(), 
    DEFAULT_GAME_ICON = "rbxasset://textures/ui/LuaApp/icons/ic-game.png", 
    UNIFIED_HOME_GAMES_FETCH_COUNT = 72, 
    DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH = 320, 
    DEFAULT_CONTEXTUAL_MENU_CANCEL_HEIGHT = 64, 
    TOP_BAR_SIZE = 64, 
    BOTTOM_BAR_SIZE = (not not v10.isEnabled() and v10.default:shouldShowNavbarLabels() or l_GetFFlagEnableNavBarLabels_0()) and 64 or 48, 
    LEFT_BAR_SIZE = 64, 
    GAMEPAD_BOTTOM_BAR_SIZE = 72, 
    SECTION_HEADER_HEIGHT = 26, 
    USER_CAROUSEL_PADDING = 15, 
    USER_CAROUSEL_SIDE_COMPACT_PADDING = 24, 
    USER_CAROUSEL_SIDE_WIDE_PADDING = 48, 
    GAME_CAROUSEL_PADDING = 15, 
    GAME_CAROUSEL_SIDE_COMPACT_PADDING = 24, 
    GAME_CAROUSEL_SIDE_WIDE_PADDING = 48, 
    GAME_CAROUSEL_CHILD_PADDING = 12, 
    GAME_GRID_PADDING = 15, 
    GAME_GRID_CHILD_PADDING = 12, 
    GAME_GRID_TILE_FOOTER_HEIGHT = 70, 
    PLAYER_GRID_TILE_FOOTER_HEIGHT = 70, 
    MORE_PAGE_ROW_HEIGHT = 50, 
    MORE_PAGE_SECTION_PADDING = 20, 
    MORE_PAGE_ROW_PADDING_LEFT = 20, 
    MORE_PAGE_ROW_PADDING_RIGHT = 10, 
    MORE_PAGE_TEXT_PADDING_WITH_ICON = 56, 
    MORE_PAGE_COMPACT_PADDING_VERTICAL = 24, 
    MORE_PAGE_WIDE_PADDING_VERTICAL = 40, 
    MORE_PAGE_COMPACT_PADDING_HORIZONTAL = 24, 
    MORE_PAGE_WIDE_PADDING_HORIZONTAL = 60, 
    MORE_PAGE_CONTENT_MAX_WIDTH = 1024, 
    PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN = 3, 
    ROUNDED_CORNER_RADIUS = 15, 
    NAV_BAR_SIZE = 56, 
    PeopleList = {
        ADD_FRIENDS_FRAME_WIDTH = 80
    }, 
    PlacesList = {
        ContextualMenu = {
            EntryHeight = 67, 
            HorizontalOuterPadding = 15, 
            HorizontalInnerPadding = 12, 
            AvatarSize = 44
        }
    }, 
    GameSortGroups = {
        ChatGames = "ChatGames", 
        Games = "Games", 
        HomeGames = "HomeGames", 
        GamesSeeAll = "GamesSeeAll", 
        GamesList = if not v7() then nil else "GamesList", 
        UnifiedHomeSorts = "UnifiedHomeSorts"
    }, 
    OmniRecommendationsPageType = {
        PAGE_TYPE_INVALID = "", 
        PAGE_TYPE_HOME = "Home", 
        PAGE_TYPE_GAMES = "Games"
    }, 
    OmniRecommendationsContentType = {
        Game = "Game", 
        CatalogAsset = "CatalogAsset", 
        CatalogBundle = "CatalogBundle", 
        RecommendedFriend = "RecommendedFriend", 
        GameCoPlay = "GameCoPlay"
    }, 
    ApiUsedForSorts = {
        ChatGames = "ChatSorts", 
        Games = "GamesDefaultSorts", 
        HomeGames = "HomeSorts", 
        GamesSeeAll = "GamesAllSorts", 
        UnifiedHomeSorts = "UnifiedHomeSorts"
    }, 
    SearchTypes = {
        Games = "Games", 
        Groups = "Groups", 
        Players = "Players", 
        Catalog = "Catalog", 
        Library = "Library", 
        Auto = "Auto"
    }, 
    GridTiles = {
        NarrowColumnCount = 2, 
        NarrowFooterHeight = 50, 
        NarrowCarouselFractionalTile = 0.25, 
        NarrowTileMargin = 8, 
        NarrowTileAdditionalOffset = 12, 
        WideColumnCount = 4
    }, 
    SearchPageType = {
        All = "all"
    }, 
    PresenceSignal = {
        EventType = "PresenceChanged"
    }, 
    JoinYourFriendsTile = {
        NarrowColumnCount = if not v6() then nil else 2, 
        WideColumnCount = if not v6() then nil else 5, 
        Width = not v6() and 158 or 0, 
        Height = not v6() and 142 or 0
    }, 
    AVATAR_PLACEHOLDER_IMAGE = "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png", 
    AssetTypeIdStringToHumanoidDescriptionProp = {
        [tostring(Enum.AssetType.TShirt.Value)] = "GraphicTShirt", 
        [tostring(Enum.AssetType.Hat.Value)] = "HatAccessory", 
        [tostring(Enum.AssetType.Shirt.Value)] = "Shirt", 
        [tostring(Enum.AssetType.Pants.Value)] = "Pants", 
        [tostring(Enum.AssetType.Head.Value)] = "Head", 
        [tostring(Enum.AssetType.Face.Value)] = "Face", 
        [tostring(Enum.AssetType.Torso.Value)] = "Torso", 
        [tostring(Enum.AssetType.RightArm.Value)] = "RightArm", 
        [tostring(Enum.AssetType.LeftArm.Value)] = "LeftArm", 
        [tostring(Enum.AssetType.LeftLeg.Value)] = "LeftLeg", 
        [tostring(Enum.AssetType.RightLeg.Value)] = "RightLeg", 
        [tostring(Enum.AssetType.HairAccessory.Value)] = "HairAccessory", 
        [tostring(Enum.AssetType.FaceAccessory.Value)] = "FaceAccessory", 
        [tostring(Enum.AssetType.NeckAccessory.Value)] = "NeckAccessory", 
        [tostring(Enum.AssetType.ShoulderAccessory.Value)] = "ShouldersAccessory", 
        [tostring(Enum.AssetType.FrontAccessory.Value)] = "FrontAccessory", 
        [tostring(Enum.AssetType.BackAccessory.Value)] = "BackAccessory", 
        [tostring(Enum.AssetType.WaistAccessory.Value)] = "WaistAccessory", 
        [tostring(Enum.AssetType.ClimbAnimation.Value)] = "ClimbAnimation", 
        [tostring(Enum.AssetType.FallAnimation.Value)] = "FallAnimation", 
        [tostring(Enum.AssetType.IdleAnimation.Value)] = "IdleAnimation", 
        [tostring(Enum.AssetType.JumpAnimation.Value)] = "JumpAnimation", 
        [tostring(Enum.AssetType.RunAnimation.Value)] = "RunAnimation", 
        [tostring(Enum.AssetType.SwimAnimation.Value)] = "SwimAnimation", 
        [tostring(Enum.AssetType.WalkAnimation.Value)] = "WalkAnimation", 
        [tostring(Enum.AssetType.DynamicHead.Value)] = "Head"
    }, 
    AnalyticsKeyword = {
        VIEW_GAME_DETAILS_FROM_ICON = "gameIcon", 
        VIEW_GAME_DETAILS_FROM_TITLE = "gameTitle", 
        VIEW_GAME_DETAILS_FROM_BUTTON = "viewDetailButton"
    }, 
    AnalyticsContext = v4.Constants.Context, 
    GameMediaImageType = {
        Image = 1, 
        YouTubeVideo = 33
    }, 
    GameDetails = {
        ActionBarHeight = 48, 
        ActionBarGradientHeight = 40, 
        PeekViewWideScreenWidth = 0.4
    }, 
    Currency = {
        Robux = 1
    }, 
    GameCardLayoutType = {
        Small = "Small", 
        Medium = "Medium", 
        Large = "Large"
    }, 
    HomePagePanelProps = {
        WidgetTextSize = 24, 
        WidgetIconSize = 26, 
        WidgetIconTextGutter = 9, 
        WidgetContentText = {
            Size = 16
        }
    }, 
    HomePageLogoSize = Vector2.new(60, 60), 
    HomeItemCardThumbnailSize = 150, 
    InputType = {
        MouseAndKeyboard = "MouseAndKeyboard", 
        Touch = "Touch", 
        Gamepad = "Gamepad", 
        None = "None"
    }, 
    RobuxIcon = "LuaApp/icons/common/robux", 
    SmallRobuxIcon = "LuaApp/icons/common/robux_small", 
    ColorRobuxIcon = "LuaApp/icons/common/robux_color", 
    Themes = {
        Dark = "dark", 
        Light = "light", 
        Classic = "classic"
    }, 
    TempRnSwitchNavigatorName = v9.Constants.TempRnSwitchNavigatorName, 
    ImpressionsEvents = {
        Game = "gameImpressions", 
        AvatarItems = "avatarItemImpressions", 
        AvatarItemsCatalog = "avatarItemImpressionsCatalog", 
        AvatarItemsCatalogSearch = "avatarItemImpressionsCatalogSearch", 
        AvatarItemsEditor = "avatarItemImpressionsEditor", 
        JoinYourFriends = "joinYourFriendImpressions"
    }, 
    WEBVIEWS_UNAVAILABLE_TOAST = {
        toastMessage = "CommonUI.Messages.Label.ActionNotAvailableOnVRHeadsetDevice", 
        isLocalized = false, 
        toastType = v2.InformationMessage
    }
};
v12.InputTypeMap = {
    [Enum.UserInputType.MouseButton1] = v12.InputType.MouseAndKeyboard, 
    [Enum.UserInputType.MouseButton2] = v12.InputType.MouseAndKeyboard, 
    [Enum.UserInputType.MouseButton3] = v12.InputType.MouseAndKeyboard, 
    [Enum.UserInputType.MouseWheel] = v12.InputType.MouseAndKeyboard, 
    [Enum.UserInputType.MouseMovement] = v12.InputType.MouseAndKeyboard, 
    [Enum.UserInputType.Keyboard] = v12.InputType.MouseAndKeyboard, 
    [Enum.UserInputType.TextInput] = v12.InputType.MouseAndKeyboard, 
    [Enum.UserInputType.Gamepad1] = v12.InputType.Gamepad, 
    [Enum.UserInputType.Gamepad2] = v12.InputType.Gamepad, 
    [Enum.UserInputType.Gamepad3] = v12.InputType.Gamepad, 
    [Enum.UserInputType.Gamepad4] = v12.InputType.Gamepad, 
    [Enum.UserInputType.Gamepad5] = v12.InputType.Gamepad, 
    [Enum.UserInputType.Gamepad6] = v12.InputType.Gamepad, 
    [Enum.UserInputType.Gamepad7] = v12.InputType.Gamepad, 
    [Enum.UserInputType.Gamepad8] = v12.InputType.Gamepad, 
    [Enum.UserInputType.Touch] = v12.InputType.Touch, 
    [Enum.UserInputType.None] = v12.InputType.None
};
v12.GameBasicStatsLayoutType = {
    [v12.GameCardLayoutType.Small] = "SmallGameCard", 
    [v12.GameCardLayoutType.Medium] = "MediumGameCard", 
    [v12.GameCardLayoutType.Large] = "LargeGameCard", 
    GameDetails = "GameDetails"
};
v12.ReportDialogEntryPoints = {
    Profile = "Profile", 
    Chat = "Chat", 
    ExperienceDetails = "ExperienceDetails"
};
v12.ReportScreen = {
    Contexts = {
        Experience = "experience", 
        Profile = "profile", 
        Item = "item"
    }, 
    AbuseVectors = {
        Place = "place", 
        User = "user"
    }, 
    Platforms = {
        Console = "console", 
        VR = "vr"
    }
};
v12.GetPageSideMargin = function(v13)
    if v13 > 600 then
        return 48;
    elseif v13 > 320 then
        return 24;
    else
        return 12;
    end;
end;
v12.IsSearchTypeInOmniSearch = function(v14)
    if not (v14 ~= v12.SearchTypes.Games and v14 ~= v12.SearchTypes.Players) or l_FFlagOmniSearchAutoTabIXP_0 and v14 == v12.SearchTypes.Auto then
        return true;
    else
        return false;
    end;
end;
v12.Auth = {
    DefaultUnauthenticatedAppTheme = "dark", 
    DefaultUnauthenticatedRobuxBalance = "0", 
    DefaultUnauthenticatedRobuxBalanceLocalized = "--", 
    DefaultUnauthenticatedGamepadMenuVirtualCursorPromptShown = "false", 
    DefaultUnauthenticatedRobloxLocaleId = "", 
    DefaultUnauthenticatedCsatCompletedSurveyIds = "{}", 
    AccountSwitcherSwitchedStatus = "switched", 
    AccountSwitcherLoginEmptyBlobRequiredError = "loginEmptyBlobRequiredError", 
    AccountSwitcherParentLoginEmptyBlobRequiredError = "parentLoginEmptyBlobRequiredError", 
    AccountSwitcherSignupEmptyBlobRequiredError = "signupEmptyBlobRequiredError", 
    AccountSwitcherParentSignupEmptyBlobRequiredError = "parentSignupEmptyBlobRequiredError", 
    AccountSwitcherSwitchError = "switchError", 
    AccountSwitcherUnavailableError = "unavailableError"
};
return v12;
