

````objc 

#import "ViewController.h"
#import "PAResponse.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[PAResponse class]];
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful); // Anything in 2xx
   
    [responseMapping addAttributeMappingsFromDictionary:@{
                                                 @"status": @"status",
                                                 @"msg": @"msg",
                                                 }];
    RKObjectMapping *userMapping = [RKObjectMapping mappingForClass:[PAUser class]];
    [userMapping addAttributeMappingsFromDictionary:@{
                                                     @"userId":  @"userId",
                                                     @"username": @"username",
                                                     @"email": @"email",
                                                     @"password": @"password",
                                                     @"headportait": @"headportait",
                                                     @"token": @"token"
                                                     }];
    
    [responseMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"data"
                                                                                   toKeyPath:@"data"
                                                                                 withMapping:userMapping]
     ];

     RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:responseMapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:statusCodes];
//     RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
  
    
     
    NSLog(@"%s==========================================",__func__);
    
//    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://plantAssistantapi.jumppo.com"]];
    RKObjectManager *manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://localhost:8070"]];
    NSDictionary *requestParameter = @{@"name":@"liuyanwei",@"pwd":@"weiwei"};
    
//    [manager setAcceptHeaderWithMIMEType:RKMIMETypeFormURLEncoded];
    [manager setRequestSerializationMIMEType:RKMIMETypeFormURLEncoded];
    [manager addResponseDescriptor:responseDescriptor];
//    [manager requestWithObject:nil method:RKRequestMethodPOST path:@"/user/login" parameters:requestParameter];
    [manager postObject:nil path:@"/user/login" parameters:requestParameter success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        //
        PAResponse *result = [mappingResult firstObject];
        NSLog(@"%@",result);
        if([result.data isKindOfClass:[PAUser class]]){
            PAUser *user = (PAUser *)result.data;
            NSLog(@"%@",user);
        }
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        //
        NSLog(@"%@",error);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


#import <Foundation/Foundation.h>
#import "PAUser.h"



@interface PAResponse : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic) NSObject *data;

@end


#import <Foundation/Foundation.h>

@interface PAUser : NSObject

@property (nonatomic ,copy) NSString *userId;
@property (nonatomic ,copy) NSString *username;
@property (nonatomic ,copy) NSString *email;
@property (nonatomic ,copy) NSString *password;
@property (nonatomic ,copy) NSString *headportait;
@property (nonatomic ,copy) NSString *token;

@end

````
