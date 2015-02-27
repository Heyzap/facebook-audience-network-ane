//
//  FacebookANE.m
//  FacebookANE
//

#import "FacebookANE.h"
#import "FlashRuntimeExtensions.h"
#import <FBAudienceNetwork/FBAudienceNetwork.h>

void FacebookANEContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx,
                                  uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet) {
    
    static FRENamedFunction functionMap[] = {};
    *numFunctionsToSet = sizeof(functionMap) / sizeof(FRENamedFunction);
    *functionsToSet = functionMap;
}

void FacebookANEContextFinalizer(FREContext ctx) {
    // context clean up
    return;
}

void FacebookANEInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                              FREContextFinalizer* ctxFinalizerToSet) {
    *extDataToSet = NULL;
    *ctxInitializerToSet = &FacebookANEContextInitializer;
    *ctxFinalizerToSet = &FacebookANEContextFinalizer;
}

void FacebookANEFinalizer(void* extData) {
    // ext cleanup -- no call guarantee
    return;
}
