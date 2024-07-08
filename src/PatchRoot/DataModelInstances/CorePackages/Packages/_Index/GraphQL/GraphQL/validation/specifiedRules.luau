local l_rules_0 = script.Parent.rules;
local l_ExecutableDefinitionsRule_0 = require(l_rules_0.ExecutableDefinitionsRule).ExecutableDefinitionsRule;
local l_UniqueOperationNamesRule_0 = require(l_rules_0.UniqueOperationNamesRule).UniqueOperationNamesRule;
local l_LoneAnonymousOperationRule_0 = require(l_rules_0.LoneAnonymousOperationRule).LoneAnonymousOperationRule;
local l_SingleFieldSubscriptionsRule_0 = require(l_rules_0.SingleFieldSubscriptionsRule).SingleFieldSubscriptionsRule;
local l_KnownTypeNamesRule_0 = require(l_rules_0.KnownTypeNamesRule).KnownTypeNamesRule;
local l_FragmentsOnCompositeTypesRule_0 = require(l_rules_0.FragmentsOnCompositeTypesRule).FragmentsOnCompositeTypesRule;
local l_VariablesAreInputTypesRule_0 = require(l_rules_0.VariablesAreInputTypesRule).VariablesAreInputTypesRule;
local l_ScalarLeafsRule_0 = require(l_rules_0.ScalarLeafsRule).ScalarLeafsRule;
local l_FieldsOnCorrectTypeRule_0 = require(l_rules_0.FieldsOnCorrectTypeRule).FieldsOnCorrectTypeRule;
local l_UniqueFragmentNamesRule_0 = require(l_rules_0.UniqueFragmentNamesRule).UniqueFragmentNamesRule;
local l_KnownFragmentNamesRule_0 = require(l_rules_0.KnownFragmentNamesRule).KnownFragmentNamesRule;
local l_NoUnusedFragmentsRule_0 = require(l_rules_0.NoUnusedFragmentsRule).NoUnusedFragmentsRule;
local l_PossibleFragmentSpreadsRule_0 = require(l_rules_0.PossibleFragmentSpreadsRule).PossibleFragmentSpreadsRule;
local l_NoFragmentCyclesRule_0 = require(l_rules_0.NoFragmentCyclesRule).NoFragmentCyclesRule;
local l_UniqueVariableNamesRule_0 = require(l_rules_0.UniqueVariableNamesRule).UniqueVariableNamesRule;
local l_NoUndefinedVariablesRule_0 = require(l_rules_0.NoUndefinedVariablesRule).NoUndefinedVariablesRule;
local l_NoUnusedVariablesRule_0 = require(l_rules_0.NoUnusedVariablesRule).NoUnusedVariablesRule;
local l_KnownDirectivesRule_0 = require(l_rules_0.KnownDirectivesRule).KnownDirectivesRule;
local l_UniqueDirectivesPerLocationRule_0 = require(l_rules_0.UniqueDirectivesPerLocationRule).UniqueDirectivesPerLocationRule;
local v20 = require(l_rules_0.KnownArgumentNamesRule);
local l_KnownArgumentNamesRule_0 = v20.KnownArgumentNamesRule;
local l_KnownArgumentNamesOnDirectivesRule_0 = v20.KnownArgumentNamesOnDirectivesRule;
local l_UniqueArgumentNamesRule_0 = require(l_rules_0.UniqueArgumentNamesRule).UniqueArgumentNamesRule;
local l_ValuesOfCorrectTypeRule_0 = require(l_rules_0.ValuesOfCorrectTypeRule).ValuesOfCorrectTypeRule;
local v25 = require(l_rules_0.ProvidedRequiredArgumentsRule);
local l_ProvidedRequiredArgumentsRule_0 = v25.ProvidedRequiredArgumentsRule;
local l_ProvidedRequiredArgumentsOnDirectivesRule_0 = v25.ProvidedRequiredArgumentsOnDirectivesRule;
local l_VariablesInAllowedPositionRule_0 = require(l_rules_0.VariablesInAllowedPositionRule).VariablesInAllowedPositionRule;
local l_OverlappingFieldsCanBeMergedRule_0 = require(l_rules_0.OverlappingFieldsCanBeMergedRule).OverlappingFieldsCanBeMergedRule;
local l_UniqueInputFieldNamesRule_0 = require(l_rules_0.UniqueInputFieldNamesRule).UniqueInputFieldNamesRule;
return {
    specifiedRules = {
        l_ExecutableDefinitionsRule_0, 
        l_UniqueOperationNamesRule_0, 
        l_LoneAnonymousOperationRule_0, 
        l_SingleFieldSubscriptionsRule_0, 
        l_KnownTypeNamesRule_0, 
        l_FragmentsOnCompositeTypesRule_0, 
        l_VariablesAreInputTypesRule_0, 
        l_ScalarLeafsRule_0, 
        l_FieldsOnCorrectTypeRule_0, 
        l_UniqueFragmentNamesRule_0, 
        l_KnownFragmentNamesRule_0, 
        l_NoUnusedFragmentsRule_0, 
        l_PossibleFragmentSpreadsRule_0, 
        l_NoFragmentCyclesRule_0, 
        l_UniqueVariableNamesRule_0, 
        l_NoUndefinedVariablesRule_0, 
        l_NoUnusedVariablesRule_0, 
        l_KnownDirectivesRule_0, 
        l_UniqueDirectivesPerLocationRule_0, 
        l_KnownArgumentNamesRule_0, 
        l_UniqueArgumentNamesRule_0, 
        l_ValuesOfCorrectTypeRule_0, 
        l_ProvidedRequiredArgumentsRule_0, 
        l_VariablesInAllowedPositionRule_0, 
        l_OverlappingFieldsCanBeMergedRule_0, 
        l_UniqueInputFieldNamesRule_0
    }, 
    specifiedSDLRules = {
        require(l_rules_0.LoneSchemaDefinitionRule).LoneSchemaDefinitionRule, 
        require(l_rules_0.UniqueOperationTypesRule).UniqueOperationTypesRule, 
        require(l_rules_0.UniqueTypeNamesRule).UniqueTypeNamesRule, 
        require(l_rules_0.UniqueEnumValueNamesRule).UniqueEnumValueNamesRule, 
        require(l_rules_0.UniqueFieldDefinitionNamesRule).UniqueFieldDefinitionNamesRule, 
        require(l_rules_0.UniqueDirectiveNamesRule).UniqueDirectiveNamesRule, 
        l_KnownTypeNamesRule_0, 
        l_KnownDirectivesRule_0, 
        l_UniqueDirectivesPerLocationRule_0, 
        require(l_rules_0.PossibleTypeExtensionsRule).PossibleTypeExtensionsRule, 
        l_KnownArgumentNamesOnDirectivesRule_0, 
        l_UniqueArgumentNamesRule_0, 
        l_UniqueInputFieldNamesRule_0, 
        l_ProvidedRequiredArgumentsOnDirectivesRule_0
    }
};
