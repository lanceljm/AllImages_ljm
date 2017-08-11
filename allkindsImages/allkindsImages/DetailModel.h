//
//  DetailModel.h
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/9.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject

/* < typeName > */
@property (strong , nonatomic) NSString  * typeName;

/* < title > */
@property (strong , nonatomic) NSString  * title;

/* < list > */
@property (strong , nonatomic) NSString  * list;

/* < itemId > */
@property (strong , nonatomic) NSString  * itemId;

/* < type > */
@property (strong , nonatomic) NSString  * type;

/* < ct > */
@property (strong , nonatomic) NSString  * ct;

@end



/*
 *
 *  {
 "showapi_res_code": 0,
 "showapi_res_error": "",
 "showapi_res_body": {
 "ret_code": 0,
 "pagebean": {
 "allPages": 42,
 "contentlist": [
 {
 "typeName": "清纯",
 "title": "给我一点阳光我就灿烂了",
 "list": [
 {
 "big": "http://img03.sogoucdn.com/app/a/100520020/54a85eb6efb54e885b58fc10ba79004c",
 "small": "http://img04.sogoucdn.com/app/a/100520076/2dd34912f3ef1ff6c44751670435d264",
 "middle": "http://img03.sogoucdn.com/app/a/100520024/5e8363ff7b12c776f254b1271accf6f5"
 }
 ],
 "itemId": "fe0b6d64f14268c2",
 "type": 4001,
 "ct": "2017-08-09 04:11:13.269"
 },
 {
 "typeName": "清纯",
 "title": "俏皮女孩床上私密照",
 "list": [
 {
 "big": "http://img04.sogoucdn.com/app/a/100520020/177d99192263085db2aea279c09eeafd",
 "small": "http://img03.sogoucdn.com/app/a/100520076/f308b5992da5185db0715559e3087746",
 "middle": "http://img03.sogoucdn.com/app/a/100520024/18887629929876e2def271e65a7cfd82"
 }
 ],
 "itemId": "2681d240240d18ff",
 "type": 4001,
 "ct": "2017-08-09 04:11:13.247"
 },
 *
 */
