local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_UIBlox_0 = v1.UIBlox;
local l_Roact_0 = v1.Roact;
local l_Promise_0 = v1.Promise;
local v5 = require(l_Parent_0.Common.Constants);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local v7 = require(l_Parent_0.Common.ProfileScreens);
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_PlayabilityStatus_0 = v1.RoduxGames.Enums.PlayabilityStatus;
local _ = require(script.Parent.profileJoinButtonMapDispatchToProps);
local _ = require(script.Parent.profileJoinButtonMapStateToProps);
local v13 = l_Roact_0.PureComponent:extend("ProfileJoinButton");
v13.init = function(v14)
    v14.joinExperience = function(v15)
        local l_props_0 = v14.props;
        l_props_0.navigateToLuaAppPages[v7.JoinGame](l_props_0.profileUserId, v5.AnalyticsContext.PeopleListInHomePage, v15);
    end;
    v14.openPurchaseExperienceModal = function()
        local l_props_1 = v14.props;
        l_props_1.openPurchaseExperienceModal({
            universeId = l_props_1.universeId
        });
    end;
    v14.joinPaidExperienceFlow = function()
        local l_props_2 = v14.props;
        l_Promise_0.all(l_props_2.getExperiencesDetails(l_props_2.universeId), l_props_2.getExperiencesProductInfo(l_props_2.universeId)):andThen(v14.openPurchaseExperienceModal);
    end;
    v14.openUnableToJoinExperienceModal = function()
        local l_props_3 = v14.props;
        l_props_3.openUnableToJoinExperienceModal({
            universeId = l_props_3.universeId
        });
    end;
    v14.preJoinCheck = function()
        local l_props_4 = v14.props;
        local function v22(v21)
            l_props_4.analytics:joinExperience({
                placeId = l_props_4.placeId, 
                rootPlaceId = l_props_4.rootPlaceId, 
                gameInstanceId = l_props_4.gameId, 
                isHomePageCarousel = not not l_props_4.navigationParams and (l_props_4.navigationParams.isHomePageCarousel or false), 
                absolutePosition = l_props_4.navigationParams and l_props_4.navigationParams.absolutePosition, 
                joinAttemptId = v21
            });
        end;
        l_props_4.getExperiencePlayabilityStatus(l_props_4.universeId):andThen(function(v23)
            if v23 == l_PlayabilityStatus_0.PurchaseRequired.rawValue() then
                v22();
                v14.joinPaidExperienceFlow();
                return ;
            elseif v23 == l_PlayabilityStatus_0.Playable.rawValue() then
                v14.joinExperience(v22);
                return ;
            else
                v22();
                v14.openUnableToJoinExperienceModal();
                return ;
            end;
        end):catch(function()
            v22();
        end);
    end;
end;
v13.render = function(v24)
    local l_props_5 = v24.props;
    return l_Roact_0.createElement(l_Button_0, {
        buttonType = l_ButtonType_0.PrimaryContextual, 
        size = l_props_5.size, 
        text = l_props_5.text, 
        layoutOrder = l_props_5.layoutOrder, 
        isLoading = l_props_5.isLoading, 
        onActivated = v24.preJoinCheck
    });
end;
return v13;
