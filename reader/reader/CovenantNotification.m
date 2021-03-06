//
//  CovenantNotification.m
//  reader
//
//  Created by Ram Mohan on 26/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CovenantNotification.h"

NSString *COVNOTIFICATION_SIGNUP = @"COVNT_SIGNUP";
NSString *COVNOTIFICATION_SIGNUP_RESULT_OK = @"COVNT_SIGNUP_OK";
NSString *COVNOTIFICATION_SIGNUP_RESULT_FAILED = @"COVNT_SIGNUP_FAILED";

NSString *COVNOTIFICATION_SIGNIN = @"COVNT_SIGIN";
NSString *COVNOTIFICATION_SIGNIN_RESULT_OK = @"COVNT_SIGIN_OK";
NSString *COVNOTIFICATION_SIGNIN_RESULT_FAILED = @"COVNT_SIGIN_FAILED";

NSString *COVNOTIFICATION_SIGNOUT = @"COVNT_SIGOUT";
NSString *COVNOTIFICATION_SIGNOUT_RESULT_OK = @"COVNT_SIGOUT_OK";
NSString *COVNOTIFICATION_SIGNOUT_RESULT_FAILED = @"COVNT_SIGOUT_FAILED";

NSString *COVNOTIFICATION_ACCOUNT_ACTIVATE = @"COVNT_ACTIVATE";
NSString *COVNOTIFICATION_ACCOUNT_ACTIVATE_RESULT_OK = @"COVNT_ACTIVATE_OK";
NSString *COVNOTIFICATION_ACCOUNT_ACTIVATE_RESULT_FAILED = @"COVNT_ACTIVATE_FAILED";

NSString *COVNOTIFICATION_GET_ACCOUNT_INFO = @"COVNT_GET_ACC_INFO";
NSString *COVNOTIFICATION_GET_ACCOUNT_INFO_RESULT_OK = @"COVNT_GET_ACC_INFO_OK";
NSString *COVNOTIFICATION_GET_ACCOUNT_INFO_RESULT_FAILED = @"COVNT_GET_ACC_INFO_FAILED";

NSString *COVNOTIFICATION_UPDATE_ACCOUNT_INFO = @"COVNT_UPDATE_ACC_INFO";
NSString *COVNOTIFICATION_UPDATE_ACCOUNT_INFO_RESULT_OK = @"COVNT_GET_ACC_INFO_OK";
NSString *COVNOTIFICATION_UPDATE_ACCOUNT_INFO_RESULT_FAILED = @"COVNT_GET_ACC_INFO_FAILED";

NSString *COVNOTIFICATION_CHANGE_PASSWORD = @"COVNT_CHANGE_PWD";
NSString *COVNOTIFICATION_CHANGE_PASSWORD_RESULT_OK = @"COVNT_CHANGE_PWD_OK";
NSString *COVNOTIFICATION_CHANGE_PASSWORD_RESULT_FAILED = @"COVNT_CHANGE_PWD_FAILED";

NSString *COVNOTIFICATION_RESET_PASSWORD = @"COVNT_RESET_PWD";
NSString *COVNOTIFICATION_RESET_PASSWORD_RESULT_OK = @"COVNT_RESET_PWD_OK";
NSString *COVNOTIFICATION_RESET_PASSWORD_RESULT_FAILED = @"COVNT_RESET_PWD_FAILED";

NSString *COVNOTIFICATION_UPDATE_DEVICE_NAME = @"COVNT_UPDT_DEV_NAME";
NSString *COVNOTIFICATION_UPDATE_DEVICE_NAME_RESULT_OK = @"COVNT_UPDT_DEV_NAME_OK";
NSString *COVNOTIFICATION_UPDATE_DEVICE_NAME_RESULT_FAILED = @"COVNT_UPDT_DEV_NAME_FAILED";

NSString *COVNOTIFICATION_UNLINK_DEVICE = @"COVNT_UNLINK_DEV";
NSString *COVNOTIFICATION_UNLINK_DEVICE_RESULT_OK = @"COVNT_UNLINK_DEV_OK";
NSString *COVNOTIFICATION_UNLINK_DEVICE_RESULT_FAILED = @"COVNT_UNLINK_DEV_FAILED";

NSString *COVNOTIFICATION_GET_CATALOGUE = @"COVNT_GET_CTLG";
NSString *COVNOTIFICATION_GET_CATALOGUE_RESULT_OK = @"COVNT_GET_CTLG_OK";
NSString *COVNOTIFICATION_GET_CATALOGUE_RESULT_FAILED = @"COVNT_GET_CTLG_FAILED";

NSString *COVNOTIFICATION_GET_CATALOGUE_QUICK_BOOKS = @"COVNT_GET_CTLG_QBKS";
NSString *COVNOTIFICATION_GET_CATALOGUE_QUICK_BOOKS_RESULT_OK = @"COVNT_GET_CTLG_QBKS_OK";
NSString *COVNOTIFICATION_GET_CATALOGUE_QUICK_BOOKS_RESULT_FAILED = @"COVNT_GET_CTLG_QBKS_FAILED";

NSString *COVNOTIFICATION_GET_CATALOGUE_BOOKS = @"COVNT_GET_CTLG_BKS";
NSString *COVNOTIFICATION_GET_CATALOGUE_BOOKS_RESULT_OK = @"COVNT_GET_CTLG_BKS_OK";
NSString *COVNOTIFICATION_GET_CATALOGUE_BOOKS_RESULT_FAILED = @"COVNT_GET_CTLG_BKS_FAILED";

NSString *COVNOTIFICATION_GET_CATALOGUE_SEARCH = @"COVNT_GET_CTLG_SRCH";
NSString *COVNOTIFICATION_GET_CATALOGUE_SEARCH_RESULT_OK = @"COVNT_GET_CTLG_SRCH_OK";
NSString *COVNOTIFICATION_GET_CATALOGUE_SEARCH_RESULT_FAILED = @"COVNT_GET_CTLG_SRCH_FAILED";

NSString *COVNOTIFICATION_BOOK_PURCHASED = @"COVNT_BK_PURCHASED";
NSString *COVNOTIFICATION_BOOK_PURCHASED_RESULT_OK = @"COVNT_BK_PURCHASED_OK";
NSString *COVNOTIFICATION_BOOK_PURCHASED_RESULT_FAILED = @"COVNT_BK_PURCHASED_FAILED";

NSString *COVNOTIFICATION_GET_TRANSACTION_HISTORY = @"COVNT_TXN_HISTORY";
NSString *COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_OK = @"COVNT_TXN_HISTORY_OK";
NSString *COVNOTIFICATION_GET_TRANSACTION_HISTORY_RESULT_FAILED = @"COVNT_TXN_HISTORY_FAILED";

NSString *COVNOTIFICATION_GET_MY_BOOKS = @"COVNT_MY_BKS";
NSString *COVNOTIFICATION_GET_MY_BOOKS_RESULT_OK = @"COVNT_MY_BKS_OK";
NSString *COVNOTIFICATION_GET_MY_BOOKS_RESULT_FAILED = @"COVNT_MY_BKS_FAILED";

NSString *COVNOTIFICATION_DOWNLOAD_BOOK = @"COVNT_DOWNLOAD_BK";
NSString *COVNOTIFICATION_DOWNLOAD_BOOK_RESULT_OK = @"COVNT_DOWNLOAD_BK_OK";
NSString *COVNOTIFICATION_DOWNLOAD_BOOK_RESULT_FAILED = @"COVNT_DOWNLOAD_BK_FAILED";

NSString *COVNOTIFICATION_GET_BOOK_DETAILS = @"COVNT_BK_DETAILS";
NSString *COVNOTIFICATION_GET_BOOK_DETAILS_RESULT_OK = @"COVNT_BK_DETAILS_OK";
NSString *COVNOTIFICATION_GET_BOOK_DETAILS_RESULT_FAILED = @"COVNT_BK_DETAILS_FAILED";

NSString *COVNOTIFICATION_GET_BOOKS_SUMMARY = @"COVNT_BKS_SUMMARY";
NSString *COVNOTIFICATION_GET_BOOKS_SUMMARY_RESULT_OK = @"COVNT_BKS_SUMMARY_OK";
NSString *COVNOTIFICATION_GET_BOOKS_SUMMARY_RESULT_FAILED = @"COVNT_BKS_SUMMARY_FAILED";

NSString *COVNOTIFICATION_LIKE_BOOK = @"COVNT_LIKE_BK";
NSString *COVNOTIFICATION_LIKE_BOOK_RESULT_OK = @"COVNT_LIKE_BK_OK";
NSString *COVNOTIFICATION_LIKE_BOOK_RESULT_FAILED = @"COVNT_LIKE_BK_FAILED";

NSString *COVNOTIFICATION_GET_MY_LIKES = @"COVNT_MY_LIKES";
NSString *COVNOTIFICATION_GET_MY_LIKES_RESULT_OK = @"COVNT_MY_LIKES_OK";
NSString *COVNOTIFICATION_GET_MY_LIKES_RESULT_FAILED = @"COVNT_MY_LIKES_FAILED";

NSString *COVNOTIFICATION_UNLIKE_BOOK = @"COVNT_UNLIKE_BK";
NSString *COVNOTIFICATION_UNLIKE_BOOK_RESULT_OK = @"COVNT_UNLIKE_BK_OK";
NSString *COVNOTIFICATION_UNLIKE_BOOK_RESULT_FAILED = @"COVNT_UNLIKE_BK_FAILED";

NSString *COVNOTIFICATION_GET_MY_WISHLIST = @"COVNT_MY_WISHLIST";
NSString *COVNOTIFICATION_GET_MY_WISHLIST_RESULT_OK = @"COVNT_MY_WISHLIST_OK";
NSString *COVNOTIFICATION_GET_MY_WISHLIST_RESULT_FAILED = @"COVNT_MY_WISHLIST_FAILED";

NSString *COVNOTIFICATION_ADD_TO_WISHLIST = @"COVNT_ADD_TO_WISHLIST";
NSString *COVNOTIFICATION_ADD_TO_WISHLIST_RESULT_OK = @"COVNT_ADD_TO_WISHLIST_OK";
NSString *COVNOTIFICATION_ADD_TO_WISHLIST_RESULT_FAILED = @"COVNT_ADD_TO_WISHLIST_FAILED";

NSString *COVNOTIFICATION_REMOVE_FROM_WISHLIST = @"COVNT_DEL_FROM_WISHLIST";
NSString *COVNOTIFICATION_REMOVE_FROM_WISHLIST_RESULT_OK = @"COVNT_DEL_FROM_WISHLIST_OK";
NSString *COVNOTIFICATION_REMOVE_FROM_WISHLIST_RESULT_FAILED = @"COVNT_DEL_FROM_WISHLIST_FAILED";

@implementation CovenantNotification

@end
