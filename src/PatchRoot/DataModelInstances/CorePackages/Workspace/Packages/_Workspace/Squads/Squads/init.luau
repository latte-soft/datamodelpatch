return {
    EnumScreens = require(script.EnumScreens), 
    Navigators = require(script.Navigators), 
    NetworkingSquads = require(script.dependencies).NetworkingSquads, 
    RoduxKey = require(script.Common.Constants).RODUX_KEY, 
    SquadEventReceiver = require(script.SquadEventReceiver), 
    SquadJoinButton = require(script.Components).SquadJoinButton, 
    SquadLeavePrompt = require(script.Components).SquadLeavePrompt, 
    installReducer = require(script.installReducer), 
    renderCoreScriptSquad = require(script.renderCoreScriptSquad), 
    ["jest.config"] = script["jest.config"]
};
