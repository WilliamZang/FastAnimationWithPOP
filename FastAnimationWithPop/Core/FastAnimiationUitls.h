//
//  FastAnimiationUitls.h
//  FastAnimationWithPop
//
//  Created by ZangChengwei on 14-6-16.
//  Copyright (c) 2014年 WilliamZang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEFINE_RW_C_TYPE_WITH_DEFAULT(flag, setter, ctype, default) \
static void *flag##Key = &flag##Key;                                \
- (void)setter:(ctype)value {                                       \
objc_setAssociatedObject(self, flag##Key, @(value),             \
OBJC_ASSOCIATION_RETAIN_NONATOMIC);                         \
}                                                                   \
- (ctype)flag {                                                     \

#define IDENTIFICATION_KEY(flag)       static void *flag##Key = &flag##Key;

#define SETTER(flag, setter, ctype)                                 \
- (void)setter:(ctype)value {                                       \
objc_setAssociatedObject(self, flag##Key, @(value),             \
OBJC_ASSOCIATION_RETAIN_NONATOMIC);                             \
}

#define GETTER(flag, ctype, ctypeGetterMethod, defaultValue)        \
- (ctype)flag {                                                     \
id value = objc_getAssociatedObject(self, flag##Key);           \
return value ? [value ctypeGetterMethod] : defaultValue;        \
}

#define DEFINE_RW_C_TYPE_PROP(flag, setter, ctype, ctypeGetterMethod, defaultValue) \
IDENTIFICATION_KEY(flag)                                                            \
SETTER(flag, setter, ctype)                                                         \
GETTER(flag, ctype, ctypeGetterMethod, defaultValue)

#define DEFINE_RW_BOOL_PROP(flag, setter, defaultValue)    \
DEFINE_RW_C_TYPE_PROP(flag, setter, BOOL, boolValue, defaultValue)

#define DEFINE_RW_DOUBLE_PROP(flag, setter, defaultValue)   \
DEFINE_RW_C_TYPE_PROP(flag, setter, double, doubleValue, defaultValue)

#define DEFINE_RW_CLASS_TYPE_PROP(classtype, flag, setter, asstype) \
IDENTIFICATION_KEY(flag)                                            \
- (void)setter:(classtype *)value {                                 \
objc_setAssociatedObject(self, flag##Key, value, asstype);      \
}                                                                   \
- (classtype *)flag {                                               \
return objc_getAssociatedObject(self, flag##Key);               \
}

#define DEFINE_RW_STRING_PROP(flag, setter)                         \
DEFINE_RW_CLASS_TYPE_PROP(NSString, flag, setter,                   \
OBJC_ASSOCIATION_COPY_NONATOMIC)

#ifdef __cplusplus
extern "C" {
#endif
    
    Class animationClassForString(NSString *animationType);
    
#ifdef __cplusplus
}
#endif
