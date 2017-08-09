//
//  GenoryModel.h
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/9.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GenoryModel : NSObject

/* < list > */
@property (strong , nonatomic) NSArray  * list;

/* < name > */
@property (strong , nonatomic) NSString  * name;

/* < id > */
//@property (strong , nonatomic) NSString  * id;

/* < name > */
//@property (strong , nonatomic) NSString  * name;
@end


/*
 *
 *  {
 "showapi_res_code": 0,
 "showapi_res_error": "",
 "showapi_res_body": {
 "ret_code": 0,
 "list": [
 {
 "name": "社会百态",
 "list": [
 {
 "id": 1001,
 "name": "社会新闻"
 },
 {
 "id": 1002,
 "name": "国内新闻"
 },
 {
 "id": 1003,
 "name": "环球动态"
 },
 {
 "id": 1004,
 "name": "军事新闻"
 }
 ]
 },
 *
 */
